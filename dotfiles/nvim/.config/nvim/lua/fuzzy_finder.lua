M = {}

function M.telescope(use)
    use {
        'nvim-telescope/telescope.nvim',
        requires = {'nvim-lua/plenary.nvim'},
        config = function()

            require('telescope').setup {
                defaults = {
                    mappings = {i = {['<C-u>'] = false, ['<C-d>'] = false}}
                }
            }
        end
    }
end

return M
