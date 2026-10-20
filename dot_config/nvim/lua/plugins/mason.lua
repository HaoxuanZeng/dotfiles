-- Customize Mason

---@type LazySpec
return {
  {
    "mason-org/mason.nvim",
    config = function(_, opts)
      require("mason").setup(opts)
      if vim.env.SSH_CONNECTION then vim.env.PATH = vim.env.HOME .. "/.local/bin:" .. vim.env.PATH end
    end,
  },
  -- use mason-tool-installer for automatically installing Mason packages
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- overrides `require("mason-tool-installer").setup(...)`
    opts = {
      -- Make sure to use the names found in `:Mason`
      ensure_installed = {
        -- install language servers
        "lua-language-server",
        "pyright",
        "clangd",
        "rust-analyzer",
        "texlab",

        -- install formatters
        "stylua",
        "ruff",

        -- install debuggers
        "debugpy",

        -- install any other package
        "tree-sitter-cli",
      },
      run_on_start = true,
      auto_update = true,
    },
  },
}
