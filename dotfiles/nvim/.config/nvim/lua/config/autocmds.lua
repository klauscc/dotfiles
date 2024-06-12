-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local api = vim.api

local timeout = 30 * 60 -- timeout in seconds

-- stop coc if lost focus for 5 mins
api.nvim_create_autocmd({ "FocusLost" }, {
  callback = function(ev)
    _G.coc_timeout_enabled = 1
    vim.defer_fn(function()
      if _G.coc_timeout_enabled == 1 then
        print("stop coc")
        vim.cmd([[ call coc#rpc#stop()]])
      end
    end, 1000 * timeout)
  end,
})

api.nvim_create_autocmd({ "FocusGained" }, {
  callback = function(ev)
    _G.coc_timeout_enabled = 0
    vim.cmd("CocStart")
  end,
})
