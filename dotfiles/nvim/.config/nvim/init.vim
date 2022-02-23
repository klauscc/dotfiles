filetype on
filetype plugin on
filetype indent on
set splitright

lua require("init")

"quickly select pairs.
map <SPACE> <Plug>(wildfire-fuel)
vmap <S-SPACE> <Plug>(wildfire-water)
let g:wildfire_objects = ["i'", 'i"', "i)", "i]", "i}", "i>", "ip", "i`"]

"undo tree
set undodir=~/.undo_history/
set undofile
nnoremap <Leader>ud :UndotreeToggle<CR>
if has("persistent_undo")
    let g:undotree_WindowLayout = 4
    set undodir=$HOME/.undodir"
    set undofile
endif

"fold
augroup folding
    autocmd!
    autocmd filetype python,markdown set foldmethod=expr
    autocmd filetype python,markdown set foldexpr=nvim_treesitter#foldexpr()
augroup END
