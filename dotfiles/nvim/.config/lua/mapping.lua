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
vim.api.nvim_set_keymap('n', '<learder>r', ":NvimTreeRefresh<CR>",
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
                        [[<cmd>lua require('telescope.builtin').find_files({previewer = false})<CR>]],
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>sb',
                        [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]],
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
vim.api.nvim_set_keymap('n', '<leader>fu', ":ARsyncUp<CR>", {noremap = true, silent = true})

-- Tagbar
vim.api.nvim_set_keymap('n', '<leader>lt', ":TagbarToggle<CR>", {noremap = true, silent = true})
