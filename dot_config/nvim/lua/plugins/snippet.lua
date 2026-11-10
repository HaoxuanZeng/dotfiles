return {
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",

    dependencies = {
      "honza/vim-snippets",
    },

    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts)
      local math = require "snippets.math"
      require("luasnip").add_snippets("tex", math)
      require("luasnip").filetype_extend("markdown", { "tex" })
    end,

    opts = {
      enable_autosnippets = true,
      update_events = "TextChanged,TextChangedI",
    },
  },

  {
    "danymat/neogen",
    opts = {
      snippet_engine = "luasnip",
    },
  },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts)

      local npairs = require "nvim-autopairs"

      for _, opening in ipairs { "(", "{", "[" } do
        for _, rules in ipairs(npairs.get_rules(opening)) do
          rules:with_pair(function(ctx)
            local ft = vim.bo[ctx.bufnr].filetype
            if ft ~= "tex" and ft ~= "markdown" then return nil end

            local before = ctx.line:sub(1, ctx.col - 1)
            if before:match "%f[%w_]lr$" then return false end

            return nil
          end, 1)
        end
      end
    end,
  },
}
