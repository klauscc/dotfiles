require('telescope').setup {
    defaults = {
        mappings = {i = {['<C-u>'] = false, ['<C-d>'] = false}},
        vimgrep_arguments = {
            "rg", "--color=never", "--no-heading", "--with-filename",
            "--line-number", "--column", "--smart-case"
        }
    }
}
require('telescope').load_extension('fzf')
require('telescope').load_extension('workspaces')
