return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    opts = {
      integrations = {
        cmp = false,
        coc_nvim = true,
      },
    },
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    opts = {
      highlight_groups = {
        CoCSearch = { fg = "love" },
        CocUnusedHighlight = { fg = "muted" },
        CocInlayHint = { fg = "muted" },

        CocErrorHighlight = { fg = "love", undercurl = true },
        CocErrorSign = { link = "error" },
        CocErrorVirtualText = { link = "error" },

        CocHintHighlight = { fg = "iris", undercurl = true },
        CocHintSign = { link = "hint" },
        CocHintVirtualText = { link = "hint" },

        CocInfoHighlight = { fg = "foam", undercurl = true },
        CocInfoSign = { link = "info" },
        CocInfoVirtualText = { link = "info" },

        CocWarningHighlight = { fg = "gold", undercurl = true },
        CocWarningSign = { link = "warning" },
        CocWarningVirtualText = { link = "warning" },
      },
    },
  },
}
