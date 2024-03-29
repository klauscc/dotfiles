lspconfig = require("lspconfig")

local on_attach = function(_, bufnr)

-- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    require"lsp_signature".on_attach()

    local opts = {noremap = true, silent = true}
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd',
                                '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD',
                                '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K',
                                '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi',
                                '<cmd>lua vim.lsp.buf.implementation()<CR>',
                                opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>',
                                '<cmd>lua vim.lsp.buf.signature_help()<CR>',
                                opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa',
                                '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>',
                                opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr',
                                '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>',
                                opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl',
                                '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',
                                opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D',
                                '<cmd>lua vim.lsp.buf.type_definition()<CR>',
                                opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn',
                                '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr',
                                '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca',
                                '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>e',
                                '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d',
                                '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d',
                                '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>d',
                                '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>so',
                                [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]],
                                opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'cf',
                                '<cmd>lua vim.lsp.buf.format { async = true }<CR>',
                                opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'cf',
    --                             '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end
local nvim_lsp = require 'lspconfig'

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Enable the following language servers
-- local servers = {'clangd', 'rust_analyzer', 'pyright', 'tsserver', 'texlab'}
local servers = {'clangd', 'rust_analyzer', 'pyright', 'tsserver', 'bashls'}
-- local servers = { 'texlab' }
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
        handlers = {
            ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp
                                                                   .diagnostic
                                                                   .on_publish_diagnostics,
                                                               {
                -- Disable virtual_text
                virtual_text = false
            })
        }

    }
end

-- Example custom server
-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

require('lspconfig').sumneko_lua.setup {
    cmd = {'lua-language-server'},
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = runtime_path
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'}
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file('', true)
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {enable = false}
        }
    }
}

-- require('lspconfig').grammarly.setup {
--     on_attach = on_attach,
--     capabilities = capabilities,
--     settings = {filetypes = {"markdown", "latex", "tex", "bib"}}
-- }

local ltex_custom_config = require("plugin.ltex")
require("lspconfig").ltex.setup({
    cmd = {
        '/Users/klaus/.local/share/nvim/lsp_servers/ltex/ltex-ls/bin/ltex-ls'
    }, -- add this if you install ltex-ls yourself
    on_attach = on_attach,
    capabilities = capabilities,
    handlers = {
        ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic
                                                               .on_publish_diagnostics,
                                                           {
            -- Disable virtual_text
            virtual_text = false
        })
    },
    settings = ltex_custom_config.lspconfig_settings()
})
require("plugin.ltex").configure()

require"lspconfig".efm.setup {
    init_options = {documentFormatting = true},
    settings = {
        rootMarkers = {".git/"},
        languages = {
            lua = {{formatCommand = "lua-format -i", formatStdin = true}},
            python = {
                {formatCommand = "black --quiet -", formatStdin = true},
                {formatCommand = "isort --quiet -", formatStdin = true}
            },
            markdown = {
                {
                    formatCommand = "pandoc -f markdown -t gfm -sp --tab-stop=4",
                    formatStdin = true
                }
            },
            json = {{formatCommand = "jq ", formatStdin = true}},
            tex = {{formatCommand = "latexindent.pl", formatStdin = true}},
            sh = {{formatCommand = "shfmt -ci -s -bn", formatStdin = true}}
        }
    }
}
