-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

vim.keymap.set("i", "jk", "<ESC>", { noremap = true, silent = true })

vim.keymap.set("n", ";q", ":q<CR>", { silent = true })
vim.keymap.set("n", ";w", ":w<CR>", { silent = true })
vim.keymap.set("v", "<leader>y", '"+y', { noremap = true, silent = true })

-- for coc
local opts = { silent = true, nowait = true, expr = true }
vim.keymap.set("n", "<C-j>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-W>j"', opts)
vim.keymap.set("n", "<C-k>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-W>k"', opts)
