-- basic
vim.api.nvim_set_keymap('i', 'jk', "<ESC>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<leader>y', "\"+y",
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>p', "\"+p", {silent = true})
vim.api.nvim_set_keymap('n', '<leader>q', ":q<CR>", {silent = true})
vim.api.nvim_set_keymap('n', '<leader>w', ":w<CR>", {silent = true})

-- luatree
vim.api.nvim_set_keymap('n', '<leader>fl', ":NvimTreeToggle<CR>",
                        {silent = true, noremap = true})

-- Remap for dealing with word wrap
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'",
                        {noremap = true, expr = true, silent = true})
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'",
                        {noremap = true, expr = true, silent = true})

-- Telescope
-- Add leader shortcuts
vim.api.nvim_set_keymap('n', '<leader><space>',
                        [[<cmd>lua require('telescope.builtin').buffers()<CR>]],
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>sf',
                        [[<cmd>lua require('telescope.builtin').find_files({previewer = false, no_ignore = true, hidden=true})<CR>]],
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>sb',
                        [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]],
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>sw',
                        [[<cmd>lua require("telescope").extensions.windows.list() <CR>]],
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>sh',
                        [[<cmd>lua require('telescope.builtin').help_tags()<CR>]],
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>st',
                        [[<cmd>lua require('telescope.builtin').tags()<CR>]],
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>sd',
                        [[<cmd>lua require('telescope.builtin').grep_string()<CR>]],
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>sp',
                        [[<cmd>lua require('telescope.builtin').live_grep()<CR>]],
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>so',
                        [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>]],
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>?',
                        [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]],
                        {noremap = true, silent = true})

-- arsync
vim.api.nvim_set_keymap('n', '<leader>fu', ":ARsyncUp<CR>",
                        {noremap = true, silent = true})

-- Tagbar
vim.api.nvim_set_keymap('n', '<leader>lt', ":SymbolsOutline<CR>",
                        {noremap = true, silent = true})

vim.api.nvim_set_keymap("n", "<Leader>nf",
                        ":lua require('neogen').generate()<CR>",
                        {noremap = true, silent = true})

-- open files

vim.api.nvim_set_keymap('n', 'g0', ":!open <cfile><CR>",

                        {noremap = true, silent = true})

-- trouble.nvim
vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>Trouble<cr>",
                        {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<leader>xw",
                        "<cmd>Trouble workspace_diagnostics<cr>",
                        {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<leader>xd",
                        "<cmd>Trouble document_diagnostics<cr>",
                        {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>",
                        {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>",
                        {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "gR", "<cmd>Trouble lsp_references<cr>",
                        {silent = true, noremap = true})

-- lspsaga
local keymap = vim.keymap.set
keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", {silent = true})

-- Code action
keymap({"n", "v"}, "<leader>ca", "<cmd>Lspsaga code_action<CR>", {silent = true})

-- Rename
keymap("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", {silent = true})

-- Peek Definition
-- you can edit the definition file in this flaotwindow
-- also support open/vsplit/etc operation check definition_action_keys
-- support tagstack C-t jump back
keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>", {silent = true})

-- Show line diagnostics
keymap("n", "<leader>e", "<cmd>Lspsaga show_line_diagnostics<CR>",
       {silent = true})

-- Show cursor diagnostics
keymap("n", "<leader>e", "<cmd>Lspsaga show_cursor_diagnostics<CR>",
       {silent = true})

-- Diagnostic jump can use `<c-o>` to jump back
keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", {silent = true})
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", {silent = true})

-- Only jump to error
keymap("n", "[E", function()
    require("lspsaga.diagnostic").goto_prev({
        severity = vim.diagnostic.severity.ERROR
    })
end, {silent = true})
keymap("n", "]E", function()
    require("lspsaga.diagnostic").goto_next({
        severity = vim.diagnostic.severity.ERROR
    })
end, {silent = true})

-- Outline
keymap("n", "<leader>o", "<cmd>Lspsaga outline<CR>", {silent = true})

-- Hover Doc
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", {silent = true})

-- Float terminal
keymap("n", "<A-d>", "<cmd>Lspsaga open_floaterm<CR>", {silent = true})
-- if you want to pass some cli command into a terminal you can do it like this
-- open lazygit in lspsaga float terminal
keymap("n", "<A-d>", "<cmd>Lspsaga open_floaterm lazygit<CR>", {silent = true})
-- close floaterm
keymap("t", "<A-d>", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]],
       {silent = true})

