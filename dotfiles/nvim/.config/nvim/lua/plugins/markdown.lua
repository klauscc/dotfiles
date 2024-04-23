return {
  {
    "iamcco/markdown-preview.nvim",
    event = "VeryLazy",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    ft = { "markdown" },
    init = function()
      vim.g.mkdp_auto_close = 0
    end,
  },
  {
    "jakewvincent/mkdnflow.nvim",
    ft = { "markdown" },
    -- commit = "5c22dfc83d619ff110258eb26beeb923402d59d2",
    config = function()
      require("mkdnflow").setup({
        -- Config goes here; leave blank for defaults
        perspective = { priority = "current", nvim_wd_heel = false },
        links = {
          transform_explicit = function(text)
            text = text:gsub(" ", "-")
            text = text:lower()
            -- text = os.date('%Y-%m-%d_') .. text
            return text
          end,
        },
        mappings = {
          MkdnNextLink = { "n", "<Tab>" },
          MkdnPrevLink = { "n", "<S-Tab>" },
          MkdnTableNextCell = { "i", "<C-j>" },
          MkdnTablePrevCell = { "i", "<C-k>" },
          MkdnTagSpan = { "v", "<C-CR>" },
        },
      })
    end,
  },
}
