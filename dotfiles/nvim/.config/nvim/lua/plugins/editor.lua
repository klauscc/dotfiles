return {

  -- arsync
  {
    "kenn7/vim-arsync",
    dependencies = {
      { "prabirshrestha/async.vim" },
    },
    keys = {
      { "<leader>fu", "<cmd>ARsyncUp<cr>", desc = "Arsync" },
    },
  },

  -- undo tree
  {
    "mbbill/undotree",
    enabled = false,
    event = { "CmdlineEnter" },
    cmd = "UndotreeToggle",
    init = function()
      vim.g.undotree_WindowLayout = 4
      vim.cmd([[
        set undodir=~/.undo_history/
        set undofile                
        if has("persistent_undo") 
        let g:undotree_WindowLayout = 4 
        set undodir=$HOME/.undodir" 
        set undofile 
        endif
                ]])
    end,
  },

  -- search and replace
  { "nvim-pack/nvim-spectre", enabled = false },
  {
    "dyng/ctrlsf.vim",
    keys = {
      { "<leader>sr", "<Plug>CtrlSFVwordPath", mode = "v", desc = "Replace in files (CtrlSF)" },
      { "<leader>sr", "<Plug>CtrlSFPrompt", mode = "n", desc = "Replace in files (CtrlSF)" },
    },
  },

  -- file explore
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      enable_diagnostics = false,
      filesystem = {
        follow_current_file = {
          enabled = false,
        },
        bind_to_cwd = false,
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
        },
        window = {
          mappings = {
            ["<space>"] = "none",
            ["s"] = "none",
            ["w"] = "none",
            ["S"] = "none",
            ["v"] = "open_vsplit",
            ["V"] = "open_split",
            ["a"] = { "add", config = { show_path = "absolute" } },
          },
        },
      },
    },
    keys = {
      {
        "<leader>fe",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = require("lazyvim.util").root.get() })
        end,
        desc = "Explorer NeoTree (cwd)",
      },
      {
        "<leader>fE",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
        end,
        desc = "Explorer NeoTree (root dir)",
      },
      { "<leader>e", "<leader>fe", desc = "Explorer NeoTree (root dir)", remap = true },
      { "<leader>E", "<leader>fE", desc = "Explorer NeoTree (cwd)", remap = true },
    },
  },

  -- multi cursor
  {
    "mg979/vim-visual-multi",
    event = "VeryLazy",
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      presets = {
        lsp_doc_border = true,
      },
      lsp = {
        progress = { enabled = false },
      },
      markdown = {
        highlights = {
          ["|%S-|"] = "@text.reference",
          ["@%S+"] = "@parameter",
          ["^%s*(Parameters:)"] = "@text.title",
          ["^%s*(Return:)"] = "@text.title",
          ["^%s*(See also:)"] = "@text.title",
          ["{%S-}"] = "@parameter",
          -- for google-style python docs
          ["^%s*(Args:)"] = "@text.title",
          ["^%s*(Returns:)"] = "@text.title",
          ["^%s*(%S+)%s*%("] = "@parameter",
          ["^%s*%S+%s*%((%S+)%)"] = "@type",
          -- ["^%s*Returns:%s* (%S+)"] = "@type",
          ["None"] = "@type",
          ["dtype%s*:%s*(%S+)"] = "@type",
        },
      },
    },
  },

  -- generate function / class docs
  {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = true,
    -- Uncomment next line if you want to follow only stable versions
    -- version = "*"
    keys = {
      { "<leader>nf", ":lua require('neogen').generate()<CR>", mode = "n", desc = "generate docs for func or class" },
    },
  },

  {
    "chentoast/marks.nvim",
    opts = {
      -- whether to map keybinds or not. default true
      default_mappings = true,
      -- which builtin marks to show. default {}
      -- builtin_marks = { ".", "<", ">", "^" },
      builtin_marks = {},
      -- whether movements cycle back to the beginning/end of buffer. default true
      cyclic = true,
      -- whether the shada file is updated after modifying uppercase marks. default false
      force_write_shada = false,
      -- how often (in ms) to redraw signs/recompute mark positions.
      -- higher values will have better performance but may cause visual lag,
      -- while lower values may cause performance penalties. default 150.
      refresh_interval = 250,
      -- sign priorities for each type of mark - builtin marks, uppercase marks, lowercase
      -- marks, and bookmarks.
      -- can be either a table with all/none of the keys, or a single number, in which case
      -- the priority applies to all marks.
      -- default 10.
      sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
      -- disables mark tracking for specific filetypes. default {}
      excluded_filetypes = {},
      -- marks.nvim allows you to configure up to 10 bookmark groups, each with its own
      -- sign/virttext. Bookmarks can be used to group together positions and quickly move
      -- across multiple buffers. default sign is '!@#$%^&*()' (from 0 to 9), and
      -- default virt_text is "".
      bookmark_0 = {
        sign = "⚑",
        virt_text = "hello world",
        -- explicitly prompt for a virtual line annotation when setting a bookmark from this group.
        -- defaults to false.
        annotate = false,
      },
      mappings = {},
    },
  },
  -- { "wellle/context.vim" },
}
