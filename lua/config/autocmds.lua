-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd("TabNewEntered", {
  group = vim.api.nvim_create_augroup("NeotreeOnNewTab", { clear = true }),
  callback = vim.schedule_wrap(function()
    vim.cmd("Neotree show reveal_force_cwd")
  end),
})

vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  group = vim.api.nvim_create_augroup("NeotreeOnOpen", { clear = true }),
  once = true,
  callback = function(_)
    vim.cmd("Neotree show reveal_force_cwd")
  end,
})
