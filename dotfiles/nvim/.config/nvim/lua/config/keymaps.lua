-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

vim.keymap.set("i", "jk", "<ESC>", { noremap = true, silent = true })

vim.keymap.set("n", ";q", ":q<CR>", { silent = true })
vim.keymap.set("n", ";w", ":w<CR>", { silent = true })
vim.keymap.set('v', '<leader>y', "\"+y", {noremap = true, silent = true})
