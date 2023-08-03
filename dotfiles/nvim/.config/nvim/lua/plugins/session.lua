-- return {}
return {

  { "folke/persistence.nvim", enabled = false },

  {
    "rmagatti/auto-session",
    config = function()
      require("auto-session").setup({
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
        session_lens = {
          load_on_setup = false,
        },
      })
    end,
  },
}
