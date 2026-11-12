return {
  {
    "OXY2DEV/markview.nvim",
    lazy = false,

    opts = {
      latex = {
        enable = false,
      },
    },

    config = function(_, opts)
      local presets = require "markview.presets"

      opts.markdown = {
        headings = presets.headings.glow,
        horizontal_rules = presets.horizontal_rules.dotted,
        tables = presets.tables.single,
        block_quotes = presets.block_quotes.obsidian,
        code_blocks = {
          enable = true,
          border_hl = "MarkviewCode",
          info_hl = "MarkviewCodeInfo",
          style = "block",
          sign = "false",
          label_direction = "right",
          label_hl = nil,
          min_width = 60,
          pad_amount = 2,
          pad_char = " ",
        },
      }

      require("markview").setup(opts)

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = vim.schedule_wrap(function(args) require("markview.actions").set_query(args.buf) end),
      })
    end,
  },

  {
    "sammaji/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    opts = {
      markdown_css = vim.fn.expand "~/.config/nvim/assets/css/markdown.css",
      highlight_css = vim.fn.expand "~/.config/nvim/assets/css/highlight.css",
    },
  },
}
