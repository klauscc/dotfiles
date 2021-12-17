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

    use 'tpope/vim-fugitive' -- Git commands in nvim
    use 'tpope/vim-rhubarb' -- Fugitive-companion to interact with github
    use 'tpope/vim-commentary' -- "gc" to comment visual regions/lines
    use 'ludovicchabant/vim-gutentags' -- Automatic tags management

    -- File explorer
    require('luatree').nvim_tree(use)

    -- UI to select things files, grep results, open buffers...)
    require('fuzzy_finder').telescope(use)

    use 'joshdick/onedark.vim' -- Theme inspired by Atom
    use 'itchyny/lightline.vim' -- Fancier statusline
    use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines
    -- Add git related info in the signs columns and popups
    use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}}
    -- Highlight, edit, and navigate code using a fast incremental parsing library
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    -- Additional textobjects for treesitter
    use 'nvim-treesitter/nvim-treesitter-textobjects'

    -- Completion
    require('complete').cmp(use)

    -- LSP
    use 'hrsh7th/cmp-nvim-lsp'
    use 'ray-x/lsp_signature.nvim'
    use {'neovim/nvim-lspconfig', config = function() require('lsp') end}
    -- Tagbar
    use 'majutsushi/tagbar'

    -- Autopairs
    use {
        'windwp/nvim-autopairs',
        config = function() require('nvim-autopairs').setup {} end
    }

    -- jump out of pairs
    require('complete').tabout(use)

    -- Snippets
    require('complete').ultisnips(use)

    -- vim arsync
    use {'kenn7/vim-arsync', config = function() end}

    -- multi cursors
    use 'mg979/vim-visual-multi'

    -- quickly select text object inside pairs
    use 'gcmt/wildfire.vim'

    -- undotree
    use 'mbbill/undotree'

    --easy motion
    use 'Lokaltog/vim-easymotion'

end)

require('basic')
require('luatree')
require('formatting')
require('complete')
require('mapping')
require('treesitter')
