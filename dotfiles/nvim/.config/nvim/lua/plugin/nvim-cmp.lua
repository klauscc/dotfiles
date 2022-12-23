local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end
local cmp = require 'cmp'

cmp.setup {
    snippet = {expand = function(args) vim.fn["UltiSnips#Anon"](args.body) end},
    preselect = cmp.PreselectMode.None,
    sources = cmp.config.sources({
        {name = 'path'}, -- for cmp-path
        {name = 'ultisnips'}, -- For ultisnips users.
        {name = 'nvim_lsp'} -- { name = 'luasnip' }, -- For luasnip users.
        -- {
        --     name = 'fuzzy_path',
        --     options = {fd_timeout_msec = 50, fd_cmd = {'fd', '-d', '4', '-p'}}
        -- }
    }, {
        -- {
        --     name = 'fuzzy_buffer',
        --     option = {
        --         get_bufnrs = function()
        --             local bufs = {}
        --             for _, win in ipairs(vim.api.nvim_list_wins()) do
        --                 bufs[vim.api.nvim_win_get_buf(win)] = true
        --             end
        --             return vim.tbl_keys(bufs)
        --         end
        --     }
        -- },
        {name = 'neorg'}, {name = 'buffer'}
    }),
    formatting = {
        format = require("lspkind").cmp_format({
            mode = 'symbol_text', -- show only symbol annotations
            maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)

            -- The function below will be called before any actual modifications from lspkind
            -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
            before = function(entry, vim_item)
                vim_item.menu = ({
                    nvim_lsp = "[LSP]",
                    ultisnips = "[Snippet]",
                    buffer = "[Buffer]",
                    path = "[Path]",
                    neorg = "[Norg]",
                    omni = (vim.inspect(vim_item.menu):gsub('%"', ""))
                })[entry.source.name]
                return vim_item
            end
        })
    },
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
                    cmp.select_next_item({behavior = cmp.SelectBehavior.Insert})
                else
                    cmp.complete()
                end
            end,
            i = function(fallback)
                if cmp.visible() then
                    cmp.select_next_item({behavior = cmp.SelectBehavior.Insert})
                elseif vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
                    vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_forward)"),
                                          'm', true)
                else
                    fallback()
                end
            end,
            s = function(fallback)
                if vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
                    vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_forward)"),
                                          'm', true)
                else
                    fallback()
                end
            end
        }),
        ["<S-Tab>"] = cmp.mapping({
            c = function()
                if cmp.visible() then
                    cmp.select_prev_item({behavior = cmp.SelectBehavior.Insert})
                else
                    cmp.complete()
                end
            end,
            i = function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item({behavior = cmp.SelectBehavior.Insert})
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
    }
}

-- Set configuration for specific filetype.
cmp.setup.filetype({'tex', 'markdown'}, {
    sources = cmp.config.sources({
        {name = 'buffer'}, {name = 'omni'}, {name = 'ultisnips'}, -- For ultisnips users.
        {name = 'nvim_lsp'}
    })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {sources = {{name = 'fuzzy_buffer'}}})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).

cmp.setup.cmdline(':', {
    sources = cmp.config.sources({{name = 'fuzzy_path'}}, {{name = 'cmdline'}})
})

-- cmp.setup.filetype({'python', 'sh', 'lua', 'tex'}, {
--     sources = cmp.config.sources({
--         {name = 'path'}, -- for cmp-path
--         {name = 'ultisnips'}, -- For ultisnips users.
--         {name = 'nvim_lsp'}, -- { name = 'luasnip' }, -- For luasnip users.
--         {name = 'spell'}
--     }, {
--         {
--             name = 'buffer'
--             -- option = {
--             --     get_bufnrs = function()
--             --         local bufs = {}
--             --         for _, win in ipairs(vim.api.nvim_list_wins()) do
--             --             bufs[vim.api.nvim_win_get_buf(win)] = true
--             --         end
--             --         return vim.tbl_keys(bufs)
--             --     end

--             -- }
--         }
--     })

-- })

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menu,menuone,noselect'
