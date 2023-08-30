return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { { "barreiroleo/ltex_extra.nvim" }, { "creativenull/efmls-configs-nvim" } },
    opts = {
      autoformat = false,
      diagnostics = {
        virtual_text = false,
      },
      format = {
        formatting_options = nil,
        timeout_ms = 5000,
      },
      inlay_hints = {
        enabled = true,
      },
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        ltex = {},
        -- efm = {
        --     init_options = { documentFormatting = true },
        --     settings = {
        --         rootMarkers = { ".git/" },
        --         languages = {
        --             lua = {
        --                 {
        --                     formatCommand =
        --                     "stylua ${--indent-width:tabSize} ${--range-start:charStart} ' .. '${--range-end:charEnd} --color Never -",
        --                     formatStdin = true,
        --                     rootMarkers = { 'stylua.toml', '.stylua.toml' },
        --                     formatCanRange = true,
        --                 }
        --             },
        --             python = {
        --                 { formatCommand = "isort --quiet - ",      formatStdin = true },
        --                 { formatCommand = "black --no-color -q -", formatStdin = true },
        --             },
        --             sh = {
        --                 { formatCommand = "beautysh -", formatStdin = true },
        --             },
        --             markdown = {
        --                 { formatCommand = "pandoc -f markdown -t gfm -sp --tab-stop=2" }
        --             }
        --         },
        --     },
        -- },
      },
      setup = {
        ltex = function()
          require("lazyvim.util").on_attach(function(client, _)
            require("ltex_extra").setup()
          end)
        end,
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
          nls.builtins.formatting.prettier,
          nls.builtins.formatting.stylua,
          nls.builtins.formatting.beautysh,
          nls.builtins.formatting.isort,
          nls.builtins.formatting.black,
          -- nls.builtins.diagnostics.mypy,
        },
      }
    end,
  },
}
