local Util = require("lazyvim.util")

return {
  {
    "telescope.nvim",
    -- enabled = false,
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        config = function()
          require("telescope").load_extension("fzf")
        end,
      },
      {
        "kyoh86/telescope-windows.nvim",
        config = function()
          require("telescope").setup({
            extensions = {
              windows = {
                -- you can set options for this extension here (like below)
                -- previewer = false
              },
            },
          })
          require("telescope").load_extension("windows")
        end,
      },
    },
    keys = {
      {
        "<leader><space>",
        "<cmd>Telescope buffers ignore_current_buffer=true sort_mru=true sort_lastused=true<cr>",
        desc = "List Buffers",
      },
      {
        "<leader>,",
        Util.telescope("files", { previewer = false, no_ignore = true, hidden = true, cwd = false }),
        desc = "List Files",
      },
      {
        "<leader>wl",
        [[<cmd>lua require("telescope").extensions.windows.list() <CR>]],
        desc = "List windows",
      },
      {
        "<leader>ff",
        Util.telescope("files", { previewer = false, no_ignore = true, hidden = true, cwd = false }),
        desc = "Find Files (root dir)",
      },
      {
        "<leader>fF",
        Util.telescope("files", { previewer = false, no_ignore = true, hidden = true, cwd = true }),
        desc = "Find Files (root dir)",
      },
    },
  },
  {
    "Yggdroot/LeaderF",
    build = ":LeaderfInstallCExtension",
    cmd = "Leaderf",
    config = function()
      vim.g.Lf_WindowPosition = "popup"
      -- vim.g.Lf_ShortcutF = "<leader>,"
    end,
    keys = {
      -- {
      --   "<leader>,",
      --   "<cmd>LeaderfFile<cr>",
      --   desc = "List Files",
      -- },
    },
  },
}
