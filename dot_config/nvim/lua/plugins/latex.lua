return {
  {
    "lervag/vimtex",
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      vim.g.vimtex_view_method = "skim"
      vim.g.vimtex_view_skim_sync = 1 -- jump to cursor after each compile
      vim.g.vimtex_view_skim_activate = 0 -- keep focus in nvim
    end,
    ft = { "tex", "bib", "plaintex" },
  },
}
