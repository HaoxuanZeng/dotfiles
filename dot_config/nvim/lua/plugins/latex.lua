return {
  {
    "lervag/vimtex",
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      vim.g.vimtex_view_method = "skim"
      vim.g.vimtex_view_skim_sync = 0 -- do not jump to cursor after each compile
      vim.g.vimtex_view_skim_activate = 0 -- keep focus in nvim
      vim.g.vimtex_quickfix_mode = 2 -- open quickfix window on compile errors
      vim.g.vimtex_quickfix_open_on_warning = 0 -- do not open quickfix window on warnings
    end,
    ft = { "tex", "bib", "plaintex" },
  },
}
