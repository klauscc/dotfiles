-- Install packer
local install_path = vim.fn.stdpath 'data' ..
                         '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' ..
                       install_path)
end

vim.cmd [[
  augroup Packer
    autocmd!
    autocmd BufWritePost *.lua PackerCompile
  augroup end
]]

local use = require('packer').use
require('packer').startup(function()
    use 'wbthomason/packer.nvim' -- Package manager

    -- use 'tpope/vim-fugitive' -- Git commands in nvim
    use 'tpope/vim-rhubarb' -- Fugitive-companion to interact with github
    use 'tpope/vim-commentary' -- "gc" to comment visual regions/lines
    -- use 'ludovicchabant/vim-gutentags' -- Automatic tags management

    -- File explorer
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons' -- optional, for file icon
        },
        config = function() require("plugin.nvim-tree") end
    }

    -- -- UI to select things files, grep results, open buffers...)
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
    use {
        'nvim-telescope/telescope.nvim',
        requires = {'nvim-lua/plenary.nvim'},
        config = function() require('plugin.telescope') end
    }

    use 'joshdick/onedark.vim' -- Theme inspired by Atom
    use 'itchyny/lightline.vim' -- Fancier statusline
    use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines

    -- Add git related info in the signs columns and popups
    use {
        'lewis6991/gitsigns.nvim',
        requires = {'nvim-lua/plenary.nvim'},
        config = function() require("plugin.gitsigns") end
    }

    -- Highlight, edit, and navigate code using a fast incremental parsing library
    use {
        'nvim-treesitter/nvim-treesitter-textobjects',
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- Completion
    require('complete').cmp(use)
    -- jump out of pairs
    require('complete').tabout(use)
    -- Snippets
    require('complete').ultisnips(use)
    use {
        'tzachar/cmp-fuzzy-path',
        requires = {'hrsh7th/nvim-cmp', 'tzachar/fuzzy.nvim'}
    }
    use {
        'tzachar/cmp-fuzzy-buffer',
        requires = {'hrsh7th/nvim-cmp', 'tzachar/fuzzy.nvim'}
    }

    -- LSP
    use {'williamboman/nvim-lsp-installer'}
    use 'ray-x/lsp_signature.nvim'
    use {'neovim/nvim-lspconfig', config = function() require('lsp') end}

    -- Tagbar
    use 'majutsushi/tagbar'

    -- Autopairs
    use {
        'windwp/nvim-autopairs',
        config = function() require('nvim-autopairs').setup {} end
    }

    -- vim arsync
    use {'kenn7/vim-arsync', config = function() end}

    -- multi cursors
    use 'mg979/vim-visual-multi'

    -- quickly select text object inside pairs
    use 'gcmt/wildfire.vim'

    -- undotree
    use 'mbbill/undotree'

    -- easy motion
    use 'ggandor/lightspeed.nvim'

    -- markdown
    use {"ellisonleao/glow.nvim"}
    use {
        'iamcco/markdown-preview.nvim',
        run = function() vim.fn['mkdp#util#install']() end,
        ft = {'markdown'}
    }

    -- auto session
    use {
        'rmagatti/auto-session',
        config = function() require("plugin.auto_session") end
    }

    -- trouble
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function() require("trouble").setup {} end
    }

    -- doc_string
    use {
        "danymat/neogen",
        config = function() require('neogen').setup {} end,
        requires = "nvim-treesitter/nvim-treesitter"
    }

    -- latex
    use {"lervag/vimtex", config = function() require("plugin.vimtex") end}
    use {
        "brymer-meneses/grammar-guard.nvim",
        requires = {"neovim/nvim-lspconfig"}
    }

    -- cursorline
    use {
        'yamatsum/nvim-cursorline',
        config = function()
            require('nvim-cursorline').setup {
                cursorline = {enable = true, timeout = 1000, number = false},
                cursorword = {
                    enable = true,
                    min_length = 3,
                    hl = {underline = true}
                }

            }
        end
    }

    -- orgmode
    use {
        "nvim-neorg/neorg",
        config = function() require("plugin.neorg") end,
        requires = "nvim-lua/plenary.nvim"
    }
    use {
        "folke/zen-mode.nvim",
        config = function() require("zen-mode").setup {} end
    }

    -- workspace
    use {
        'natecraddock/workspaces.nvim',
        config = function() require("plugin.workspaces") end
    }

    -- terminal
    use {
        's1n7ax/nvim-terminal',
        config = function()
            vim.o.hidden = true
            require('nvim-terminal').setup()
        end
    }

end)

require('basic')
require('mapping')
require('plugin.treesitter')
