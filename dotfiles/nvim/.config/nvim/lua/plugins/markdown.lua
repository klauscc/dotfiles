return {
  {
    "iamcco/markdown-preview.nvim",
    event = "VeryLazy",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    ft = { "markdown" },
  },
  {
    "jakewvincent/mkdnflow.nvim",
    ft = { "markdown" },
    -- commit = "5c22dfc83d619ff110258eb26beeb923402d59d2",
    config = function()
      require("mkdnflow").setup({
        -- Config goes here; leave blank for defaults
        perspective = { priority = "current" },
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
          MkdnTableNextCell = false,
          MkdnTablePrevCell = false,
        },
      })
    end,
  },
}
