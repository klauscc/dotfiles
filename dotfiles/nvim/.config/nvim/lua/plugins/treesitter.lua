return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = ";<space>",
          node_incremental = ";<space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    },
  },
}
