return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      autoformat = false,
      diagnostics = {
        virtual_text = false,
      },
      format = {
        formatting_options = nil,
        timeout_ms = 2000,
      },
      inlay_hints = {
        enabled = true,
      },
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        pyright = {},
      },
    },
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- change a keymap
      keys[#keys + 1] = { ";e", "<cmd>lua vim.diagnostic.open_float()<cr>" }
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function()
      local nls = require("null-ls")
      return {
        root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
        sources = {
          nls.builtins.formatting.fish_indent,
          nls.builtins.diagnostics.fish,
          nls.builtins.formatting.stylua,
          nls.builtins.formatting.beautysh,
          nls.builtins.formatting.black,
          -- nls.builtins.diagnostics.flake8,
        },
      }
    end,
  },
}
