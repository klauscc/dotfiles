-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

opt.autowrite=false
opt.relativenumber=false

opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.clipboard=""
opt.spelllang = {}
