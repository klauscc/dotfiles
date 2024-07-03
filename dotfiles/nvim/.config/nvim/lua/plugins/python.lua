return {
  {
    "Vimjas/vim-python-pep8-indent",
  },
  {
    "kiyoon/jupynium.nvim",
    ft = "python",
    build = "pip install --user .",
    -- build = "conda run --no-capture-output -n jupynium pip install .",
    -- enabled = vim.fn.isdirectory(vim.fn.expand "~/miniconda3/envs/jupynium"),
  },
  {
    "Vigemus/iron.nvim",
    enabled = true,
    ft = "python",
    config = function()
      require("iron.core").setup({
        config = {
          repl_definition = {
            python = {
              command = { "ssh", "-t", "-Y", "sun", "ipython", "--no-autoindent" },
              -- command = { "sshpass", "-f", "~/.pwd", "ssh", "-t", "-Y", "opr", "ipython", "--no-autoindent" },
              -- command = { "ipython" },
            },
          },
          repl_open_cmd = require("iron.view").split.vertical.botright(60),
        },
        highlight = {
          italic = false,
        },
        keymaps = {
          send_motion = "<cr>",
          visual_send = "<cr>",
          send_file = "<leader>rf",
          send_line = "<leader>rl",
          send_until_cursor = "<leader>ru",
          send_mark = "<leader>rm",
          mark_motion = "<leader>mc",
          mark_visual = "<leader>mc",
          remove_mark = "<leader>md",
          cr = "<leader><cr>",
          interrupt = "<leader>ri",
          exit = "<leader>rq",
          clear = "<leader>rl",
        },
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "ninja", "python", "rst", "toml" })
      end
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ruff_lsp = {
          init_options = {
            settings = {
              -- Any extra CLI arguments for `ruff` go here.
              args = { "--ignore E501" },
            },
          },
        },
        pyright = {
          settings = {
            python = {
              analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "openFilesOnly",
                typeCheckingMode = "basic",
                diagnosticSeverityOverrides = {
                  reportPrivateImportUsage = "none",
                  reportGeneralTypeIssues = "none",
                },
              },
            },
          },
        },
      },
      setup = {
        ruff_lsp = function()
          require("lazyvim.util").lsp.on_attach(function(client, _)
            if client.name == "ruff_lsp" then
              -- Disable hover in favor of Pyright
              client.server_capabilities.hoverProvider = false
            end
          end)
        end,
      },
    },
  },
  {
    -- "numiras/semshi",
    "wookayin/semshi", -- use a maintained fork
    enabled = false,
    ft = "python",
    build = ":UpdateRemotePlugins",
    init = function()
      -- Disabled these features better provided by LSP or other more general plugins
      vim.g["semshi#error_sign"] = false
      vim.g["semshi#simplify_markup"] = false
      vim.g["semshi#mark_selected_nodes"] = false
      vim.g["semshi#update_delay_factor"] = 0.001

      -- This autocmd must be defined in init to take effect
      vim.api.nvim_create_autocmd({ "VimEnter", "ColorScheme" }, {
        group = vim.api.nvim_create_augroup("SemanticHighlight", {}),
        callback = function()
          -- Only add style, inherit or link to the LSP's colors
          vim.cmd([[
            highlight! link semshiGlobal  @none
            highlight! link semshiImported @none
            highlight! link semshiParameter @lsp.type.parameter
            highlight! link semshiBuiltin @function.builtin
            highlight! link semshiAttribute @field
            highlight! link semshiSelf @lsp.type.selfKeyword
            highlight! link semshiUnresolved @none
            highlight! link semshiFree @none
            highlight! link semshiAttribute @none
            highlight! link semshiParameterUnused @none
            ]])
        end,
      })
    end,
  },
}
