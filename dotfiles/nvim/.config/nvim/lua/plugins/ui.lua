return {
  {
    "luukvbaal/statuscol.nvim",
    config = function()
      local builtin = require("statuscol.builtin")
      require("statuscol").setup({
        relculright = true,
        segments = {
          { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
          { text = { "%s" }, click = "v:lua.ScSa" },
          { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
        },
      })
    end,
  },
  {
    "folke/noice.nvim",
    keys = {
      { "<c-f>", mode = { "i", "n", "s" }, false },
      { "<c-b>", mode = { "i", "n", "s" }, false },
    },
  },
}
