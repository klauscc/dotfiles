-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- disable autoformat for LazyVim
vim.g.autoformat = false

local opt = vim.opt

opt.expandtab = true
opt.autowrite = false
opt.relativenumber = false

opt.clipboard = ""
opt.spelllang = {}
opt.wrap = true

-- coc: Some servers have issues with backup files, see #649
opt.backup = false
opt.writebackup = false
opt.updatetime = 300
