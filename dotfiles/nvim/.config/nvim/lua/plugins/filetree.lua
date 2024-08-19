return {
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    enabled = false,
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Explorer NvimTree (Root Dir)", remap = true },
    },
    config = function()
      require("nvim-tree").setup({})
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = true,
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
            ["h"] = "none",
            ["l"] = "none",
            ["S"] = "none",
            ["<tab>"] = "open_vsplit",
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
}
