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
        CocUnusedHighlight = { fg = "muted" },
        CocInlayHint = { fg = "muted" },
        CocErrorHighlight = { link = "error" },
        CocErrorSign = { link = "error" },
        CocErrorVirtualText = { link = "error" },
        CocHintHighlight = { link = "hint" },
        CocHintSign = { link = "hint" },
        CocHintVirtualText = { link = "hint" },
        CocInfoHighlight = { link = "info" },
        CocInfoSign = { link = "info" },
        CocInfoVirtualText = { link = "info" },
        CocWarningHighlight = { link = "warning" },
        CocWarningSign = { link = "warning" },
      },
    },
  },
}
