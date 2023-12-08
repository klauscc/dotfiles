return {

  -- add symbols-outline
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    config = function()
      require("symbols-outline").setup({
        autofold_depth = 2,
        width = 16,
        auto_unfold_hover = false,
      })
    end,
  },

  -- snippets
  { "rafamadriz/friendly-snippets", enabled = false },
  { "L3MON4D3/LuaSnip", enabled = false },
  {
    "SirVer/ultisnips",
    dependencies = { "honza/vim-snippets" },
    config = function()
      vim.g.ultisnips_python_style = "google"
    end,
  },
}
