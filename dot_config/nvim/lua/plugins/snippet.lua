return {
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",

    dependencies = {
      "honza/vim-snippets",
    },

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
