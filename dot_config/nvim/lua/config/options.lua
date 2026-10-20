if vim.env.SSH_CONNECTION then vim.g.clipboard = "osc52" end

---@type LazySpec
return {
  {
    "AstroNvim/astrocore",
    opts = {
      features = {
        large_buf = { size = 1024 * 256, lines = 10000 },
        autopairs = true,
        cmp = true,
        diagnostics = true,
        highlighturl = true,
        notifications = true,
      },
      diagnostics = {
        virtual_text = true,
        virtual_lines = false,
        update_in_insert = false,
        underline = true,
        severity_sort = true,
      },
      options = {
        opt = {
          relativenumber = false,
          number = true,
          spell = false,
          signcolumn = "yes",
          wrap = true,
          autochdir = false,
        },
      },
    },
  },
  {
    "AstroNvim/astroui",
    opts = {
      colorscheme = "houston",
    },
  },
  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        list = {
          selection = {
            preselect = true,
            auto_insert = false,
          },
        },
      },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      preset = "helix",
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        bind_to_cwd = true,
        follow_current_file = { enabled = false },
      },
    },
  },
  {
    "devbydaniel/houston.nvim",
    opts = {
      transparent = false,
      italic_comments = true,
    },
  },
  {
    "folke/noice.nvim",
    opts = {
      cmdline = {
        enabled = true,
        view = "cmdline_popup",
      },
      lsp = {
        hover = { enabled = false },
        signature = { enabled = false },
      },
      presets = {
        bottom_search = false,
        command_palette = true,
        long_message_to_split = true,
      },
    },
  },
  {
    "rebelot/heirline.nvim",
    opts = function(_, opts)
      table.insert(opts.statusline, 7, {
        condition = function() return vim.g.remote_neovim_host == true end,
        provider = function() return (" REMOTE: %s "):format(vim.uv.os_gethostname()) end,
        hl = { bold = true },
      })
    end,
  },
}
