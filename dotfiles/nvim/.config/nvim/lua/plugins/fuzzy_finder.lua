local Util = require("lazyvim.util")

return {
  {
    "telescope.nvim",
    opts = {
      defaults = {
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--hidden",
        },
        file_ignore_patterns = { ".git/" },
      },
      extensions = {
        coc = {
          theme = "ivy",
          prefer_locations = true, -- always use Telescope locations to preview definitions/declarations/implementations etc
        },
        windows = {},
      },
    },
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        config = function()
          require("telescope").load_extension("fzf")
        end,
      },
      {
        "kyoh86/telescope-windows.nvim",
        config = function()
          require("telescope").load_extension("windows")
        end,
      },
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
        config = function()
          require("telescope").load_extension("live_grep_args")
        end,
      },
      {
        "fannheyward/telescope-coc.nvim",
        config = function()
          require("telescope").load_extension("coc")
        end,
      },
    },
    keys = {
      {
        "<leader><space>",
        "<cmd>Telescope buffers ignore_current_buffer=true sort_mru=true sort_lastused=true<cr>",
        desc = "List Buffers",
      },
      {
        "<leader>,",
        Util.pick("files", { previewer = false, no_ignore = true, hidden = true }),
        desc = "Find Files (root)",
      },
      {
        "<leader>wl",
        [[<cmd>lua require("telescope").extensions.windows.list() <CR>]],
        desc = "List windows",
      },
      {
        "<leader>sg",
        function()
          require("telescope").extensions.live_grep_args.live_grep_args()
        end,
        desc = "Grep (root dir)",
      },
      {
        "<leader>sg",
        function()
          require("telescope-live-grep-args.shortcuts").grep_visual_selection()
        end,
        mode = "v",
        desc = "Grep (root dir)",
      },
      { "<leader>sG", Util.pick("live_grep", { cwd = false, hidden = true }), desc = "Grep (cwd)" },

      -- coc
      {
        "gr",
        "<cmd>Telescope coc references<cr>",
        desc = "coc goto references",
      },
    },
  },
  -- {
  --   "Yggdroot/LeaderF",
  --   enabled = false,
  --   build = ":LeaderfInstallCExtension",
  --   cmd = "Leaderf",
  --   config = function()
  --     vim.g.Lf_WindowPosition = "popup"
  --     vim.g.Lf_ShortcutF = "<leader>,"
  --   end,
  --   keys = {
  --     {
  --       "<leader><space>",
  --       "<cmd>Leaderf buffer<cr>",
  --       desc = "List Buffers",
  --     },
  --     {
  --       "<leader>,",
  --       "<cmd>Leaderf file --no-auto-preview<cr>",
  --       desc = "List Files",
  --     },
  --     {
  --       "<leader>wl",
  --       [[<cmd>Leaderf window<CR>]],
  --       desc = "List windows",
  --     },
  --     {
  --       "<leader>ff",
  --       Util.telescope("files", { previewer = false, no_ignore = true, hidden = true, cwd = false }),
  --       "<cmd>Leaderf file --no-auto-preview<cr>",
  --       desc = "Find Files (root dir)",
  --     },
  --     { "<leader>,", "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Switch Buffer" },
  --     { "<leader>/", Util.telescope("live_grep"), desc = "Grep (root dir)" },
  --     { "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Command History" },
  --     { "<leader><space>", Util.telescope("files"), desc = "Find Files (root dir)" },
  --     -- find
  --     { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
  --     { "<leader>ff", Util.telescope("files"), desc = "Find Files (root dir)" },
  --     { "<leader>fF", Util.telescope("files", { cwd = false }), desc = "Find Files (cwd)" },
  --     { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
  --     { "<leader>fR", Util.telescope("oldfiles", { cwd = vim.loop.cwd() }), desc = "Recent (cwd)" },
  --     -- git
  --     { "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "commits" },
  --     { "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "status" },
  --     -- search
  --     { '<leader>s"', "<cmd>Telescope registers<cr>", desc = "Registers" },
  --     { "<leader>sa", "<cmd>Telescope autocommands<cr>", desc = "Auto Commands" },
  --     { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
  --     { "<leader>sc", "<cmd>Telescope command_history<cr>", desc = "Command History" },
  --     { "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
  --     { "<leader>sd", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document diagnostics" },
  --     { "<leader>sD", "<cmd>Telescope diagnostics<cr>", desc = "Workspace diagnostics" },
  --     { "<leader>sg", Util.telescope("live_grep"), desc = "Grep (root dir)" },
  --     { "<leader>sG", Util.telescope("live_grep", { cwd = false }), desc = "Grep (cwd)" },
  --     { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
  --     { "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Search Highlight Groups" },
  --     { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
  --     { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
  --     { "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Jump to Mark" },
  --     { "<leader>so", "<cmd>Telescope vim_options<cr>", desc = "Options" },
  --     { "<leader>sR", "<cmd>Telescope resume<cr>", desc = "Resume" },
  --     { "<leader>sw", Util.telescope("grep_string", { word_match = "-w" }), desc = "Word (root dir)" },
  --     { "<leader>sW", Util.telescope("grep_string", { cwd = false, word_match = "-w" }), desc = "Word (cwd)" },
  --     { "<leader>sw", Util.telescope("grep_string"), mode = "v", desc = "Selection (root dir)" },
  --     { "<leader>sW", Util.telescope("grep_string", { cwd = false }), mode = "v", desc = "Selection (cwd)" },
  --     { "<leader>uC", Util.telescope("colorscheme", { enable_preview = true }), desc = "Colorscheme with preview" },
  --     {
  --       "<leader>ss",
  --       Util.telescope("lsp_document_symbols", {
  --         symbols = {
  --           "Class",
  --           "Function",
  --           "Method",
  --           "Constructor",
  --           "Interface",
  --           "Module",
  --           "Struct",
  --           "Trait",
  --           "Field",
  --           "Property",
  --         },
  --       }),
  --       desc = "Goto Symbol",
  --     },
  --     {
  --       "<leader>sS",
  --       Util.telescope("lsp_dynamic_workspace_symbols", {
  --         symbols = {
  --           "Class",
  --           "Function",
  --           "Method",
  --           "Constructor",
  --           "Interface",
  --           "Module",
  --           "Struct",
  --           "Trait",
  --           "Field",
  --           "Property",
  --         },
  --       }),
  --       desc = "Goto Symbol (Workspace)",
  --     },
  --   },
  -- },
}
