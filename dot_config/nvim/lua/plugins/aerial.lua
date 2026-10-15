return {
  {
    "stevearc/aerial.nvim",
    opts = {},
    -- Optional dependencies
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      { "<D-S-r>", "<Cmd>AerialToggle!<CR>", mode = { "n", "i" }, desc = "Aerial" },
    },
  },
}
