return {
  {
    "telescope.nvim",
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
        "<leader>,",
        "<cmd>Telescope buffers ignore_current_buffer=true sort_mru=true sort_lastused=true<cr>",
        desc = "Switch Buffer",
      },
      {
        "<leader>wl",
        [[<cmd>lua require("telescope").extensions.windows.list() <CR>]],
        desc = "List windows",
      },
    },
  },
}
