M = {}

-- nvim-cmp setup
function M.cmp(use)
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-cmdline'
    use {'f3fora/cmp-spell'}
    use {'hrsh7th/cmp-path', --[[ commit = 'd83839ae' ]]} -- complete system path.
    use {'onsails/lspkind.nvim'}
    use {'hrsh7th/cmp-omni'}
    use {
        'tzachar/cmp-fuzzy-path',
        requires = {'hrsh7th/nvim-cmp', 'tzachar/fuzzy.nvim'}
    }
    use {
        'tzachar/cmp-fuzzy-buffer',
        requires = {'hrsh7th/nvim-cmp', 'tzachar/fuzzy.nvim'}
    }
    use {
        'hrsh7th/nvim-cmp', -- Autocompletion plugin
        config = function() require("plugin.nvim-cmp") end

    }

end

-- tabout setup
function M.tabout(use)
    use {
        'abecodes/tabout.nvim',
        config = function()

            require('tabout').setup {
                tabkey = '<Tab>', -- key to trigger tabout, set to an empty string to disable
                backwards_tabkey = '<S-Tab>', -- key to trigger backwards tabout, set to an empty string to disable
                act_as_tab = true, -- shift content if tab out is not possible
                act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
                enable_backwards = true, -- well ...
                completion = true, -- if the tabkey is used in a completion pum
                tabouts = {
                    {open = "'", close = "'"}, {open = '"', close = '"'},
                    {open = '`', close = '`'}, {open = '(', close = ')'},
                    {open = '[', close = ']'}, {open = '{', close = '}'}
                },
                ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
                exclude = {'lua'} -- tabout will ignore these filetypes
            }
        end,
        wants = {'nvim-treesitter'}, -- or require if not used so far
        after = {'nvim-cmp'} -- if a completion plugin is using tabs load it before
    }
end

function M.ultisnips(use)
    use({
        'SirVer/ultisnips',
        requires = {{'honza/vim-snippets', rtp = '.'}},
        config = function()
            vim.g.UltiSnipsExpandTrigger = '<Plug>(ultisnips_expand)'
            vim.g.UltiSnipsJumpForwardTrigger = '<Plug>(ultisnips_jump_forward)'
            vim.g.UltiSnipsJumpBackwardTrigger =
                '<Plug>(ultisnips_jump_backward)'
            vim.g.UltiSnipsListSnippets = '<c-x><c-s>'
            vim.g.UltiSnipsRemoveSelectModeMappings = 0
            vim.g.ultisnips_python_style = "google"
        end
    })
    use 'quangnguyen30192/cmp-nvim-ultisnips'

end

return M
