-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Neovim 0.11+ shows "[Process exited N]" as virtual text on TermClose, not as a
-- buffer line. snacks.nvim's old workaround (deleting a line) no longer applies.
-- Remove only the exit-message handler; keep the other nvim.terminal TermClose
-- (auto-close idle shell). See :help terminal-config
do
  local function strip_terminal_exitmsg_autocmd()
    for _, a in ipairs(vim.api.nvim_get_autocmds({ group = "nvim.terminal", event = "TermClose" }) or {}) do
      if a.desc == 'Displays the "[Process exited]" virtual text' then
        pcall(vim.api.nvim_del_autocmd, a.id)
      end
    end
  end
  strip_terminal_exitmsg_autocmd()
  vim.api.nvim_create_autocmd("VimEnter", {
    once = true,
    callback = function()
      vim.schedule(strip_terminal_exitmsg_autocmd)
    end,
  })
end
