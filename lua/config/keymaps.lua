-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

vim.keymap.set({ "n" }, "<C-c>", '"+y$')
vim.keymap.set({ "v" }, "<C-c>", '"+y')

vim.keymap.set({ "v", "n" }, "<C-y>", '"+p')
vim.keymap.set({ "i", "c" }, "<C-y>", "<c-r>+") -- insert from system clipboard

vim.keymap.set({ "v", "n" }, "<leader>fs", ":w<CR>")

vim.keymap.set({ "n", "v" }, "<leader>a", ":Gen<CR>")

vim.keymap.set({ "n", "v" }, "<leader>ff", "<cmd>Telescope find_files<cr>")

vim.keymap.set({ "n", "v" }, "<leader><leader>", ":")
