M = {}

function M.telescope(use)
    -- use 'nvim-lua/popup.nvim'
    -- use 'nvim-telescope/telescope-media-files.nvim'
    use {
        'nvim-telescope/telescope.nvim',
        requires = {'nvim-lua/plenary.nvim'},
        config = function()

            require('telescope').setup {
                defaults = {
                    mappings = {i = {['<C-u>'] = false, ['<C-d>'] = false}},
                    vimgrep_arguments = {
                        "rg", "--color=never", "--no-heading",
                        "--with-filename", "--line-number", "--column",
                        "--smart-case"
                    }
                }
                -- extensions = {
                --     media_files = {
                --         -- filetypes whitelist
                --         -- filetypes = {"png", "jpg", "mp4", "webm", "pdf"},
                --         filetypes = {"png", "webp", "jpg", "jpeg", "pdf"}
                --         -- find_cmd = "rg" -- find command (defaults to `fd`)
                --     }
                -- }
            }
            -- require('telescope').load_extension('media_files')
        end
    }

end

return M
