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
}
