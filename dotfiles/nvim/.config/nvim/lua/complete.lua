M = {}

-- nvim-cmp setup
function M.cmp(use)
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-cmdline'
    use {'hrsh7th/cmp-path', commit = 'd83839ae'} -- complete system path.
    use {
        'hrsh7th/nvim-cmp', -- Autocompletion plugin
        config = function()
            local t = function(str)
                return vim.api.nvim_replace_termcodes(str, true, true, true)
            end
            local cmp = require 'cmp'

            -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline('/', {sources = {{name = 'buffer'}}})

            -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).

            cmp.setup.cmdline(':', {
                sources = cmp.config
                    .sources({{name = 'path'}}, {{name = 'cmdline'}})
            })
            cmp.setup {
                snippet = {
                    expand = function(args)
                        vim.fn["UltiSnips#Anon"](args.body)
                    end
                },
                preselect = cmp.PreselectMode.None,
                mapping = {
                    ['<C-p>'] = cmp.mapping.select_prev_item(),
                    ['<C-n>'] = cmp.mapping.select_next_item(),
                    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.close(),
                    ['<CR>'] = cmp.mapping.confirm {
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = false
                    },
                    ["<Tab>"] = cmp.mapping({
                        c = function()
                            if cmp.visible() then
                                cmp.select_next_item({
                                    behavior = cmp.SelectBehavior.Insert
                                })
                            else
                                cmp.complete()
                            end
                        end,
                        i = function(fallback)
                            if cmp.visible() then
                                cmp.select_next_item({
                                    behavior = cmp.SelectBehavior.Insert
                                })
                            elseif vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
                                vim.api.nvim_feedkeys(t(
                                                          "<Plug>(ultisnips_jump_forward)"),
                                                      'm', true)
                            else
                                fallback()
                            end
                        end,
                        s = function(fallback)
                            if vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
                                vim.api.nvim_feedkeys(t(
                                                          "<Plug>(ultisnips_jump_forward)"),
                                                      'm', true)
                            else
                                fallback()
                            end
                        end
                    }),
                    ["<S-Tab>"] = cmp.mapping({
                        c = function()
                            if cmp.visible() then
                                cmp.select_prev_item({
                                    behavior = cmp.SelectBehavior.Insert
                                })
                            else
                                cmp.complete()
                            end
                        end,
                        i = function(fallback)
                            if cmp.visible() then
                                cmp.select_prev_item({
                                    behavior = cmp.SelectBehavior.Insert
                                })
                            elseif vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
                                return vim.api.nvim_feedkeys(t(
                                                                 "<Plug>(ultisnips_jump_backward)"),
                                                             'm', true)
                            else
                                fallback()
                            end
                        end,
                        s = function(fallback)
                            if vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
                                return vim.api.nvim_feedkeys(t(
                                                                 "<Plug>(ultisnips_jump_backward)"),
                                                             'm', true)
                            else
                                fallback()
                            end
                        end
                    })
                },
                sources = cmp.config.sources({
                    {name = 'path'}, -- for cmp-path
                    {name = 'ultisnips'}, -- For ultisnips users.
                    {name = 'nvim_lsp'} -- { name = 'luasnip' }, -- For luasnip users.
                }, {
                    {
                        name = 'buffer'
                        -- option = {
                        --     get_bufnrs = function()
                        --         local bufs = {}
                        --         for _, win in ipairs(vim.api.nvim_list_wins()) do
                        --             bufs[vim.api.nvim_win_get_buf(win)] = true
                        --         end
                        --         return vim.tbl_keys(bufs)
                        --     end

                        -- }
                    }
                })
            }
            -- Set completeopt to have a better completion experience
            vim.o.completeopt = 'menu,menuone,noselect'

        end

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
