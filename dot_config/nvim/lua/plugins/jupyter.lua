return {
  {
    "GCBallesteros/jupytext.nvim",
    lazy = false,
    opts = {
      style = "percent",
      output_extension = "py",
      force_ft = "python",
    },
  },
  {
    "benlubas/molten-nvim",
    lazy = false,
    build = ":UpdateRemotePlugins",
    dependencies = { "3rd/image.nvim" },
    init = function()
      vim.g.python3_host_prog = require("venv-selector").python()
      vim.g.molten_image_provider = "image.nvim"
      vim.g.molten_virt_text_output = true
      vim.g.molten_virt_text_max_lines = 40
      vim.g.molten_output_virt_lines = true
      vim.g.molten_wrap_output = true
      vim.g.molten_auto_open_output = false
    end,
    keys = {
      {
        "<LocalLeader>mi",
        function()
          local python = assert(require("venv-selector").python(), "Select a Python environment with :VenvSelect")
          local kernel = "nvim-" .. vim.fn.sha256(python):sub(1, 12)
          local command = { python, "-m", "ipykernel", "install", "--user", "--name", kernel }
          local result = vim.system(command, { text = true }):wait()
          assert(result.code == 0, result.stderr)
          if #vim.fn.MoltenRunningKernels(true) > 0 then vim.cmd.MoltenDeinit() end
          vim.cmd("MoltenInit " .. kernel)

          local directory = vim.fn.expand "%:p:h"
          vim.cmd.MoltenEvaluateArgument {
            args = {
              kernel,
              "__import__('os').chdir(" .. vim.json.encode(directory) .. ")",
            },
          }

          vim.b.molten_venv_python = python
        end,
        ft = "python",
        desc = "Start selected Python kernel",
      },
      { "<LocalLeader>mo", "<Cmd>noautocmd MoltenEnterOutput<CR>", ft = "python", desc = "Open output" },
    },
  },
  {
    "GCBallesteros/NotebookNavigator.nvim",
    ft = "python",
    dependencies = { "benlubas/molten-nvim" },
    opts = { repl_provider = "molten" },
    keys = {
      {
        "<S-CR>",
        function()
          local python = require("venv-selector").python()
          assert(
            python and python == vim.b.molten_venv_python and #vim.fn.MoltenRunningKernels(true) == 1,
            "Initialize the selected environment with ,mi"
          )
          vim.cmd.stopinsert()
          local cell = require("notebook-navigator").miniai_spec "i"
          if cell.from.line <= cell.to.line then
            vim.fn.MoltenEvaluateRange(
              cell.from.line,
              math.max(cell.from.line, vim.fn.prevnonblank(cell.to.line)),
              1,
              vim.v.maxcol
            )
          end
        end,
        mode = { "n", "i" },
        ft = "python",
        desc = "Run current cell",
      },
    },
  },
}
