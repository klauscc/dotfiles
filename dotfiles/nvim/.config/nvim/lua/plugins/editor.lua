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
      filesystem = {
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
}
