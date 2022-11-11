filetype on
filetype plugin on
filetype indent on
set splitright

lua require("pluginlist")

"quickly select pairs.
map <SPACE> <Plug>(wildfire-fuel)
vmap <S-SPACE> <Plug>(wildfire-water)
let g:wildfire_objects = ["i'", 'i"', "i)", "i]", "i}", "i>", "ip", "i`", "i$"]

"undo tree
 set undodir=~/.undo_history/
 set undofile                
 if has("persistent_undo") 
 let g:undotree_WindowLayout = 4 
 set undodir=$HOME/.undodir" 
 set undofile 
 endif
 nnoremap <Leader>ud :UndotreeToggle<CR>

"fold
" augroup folding
"     autocmd!
"     autocmd FileType python,markdown setlocal foldmethod=expr
"     autocmd FileType python,markdown setlocal foldexpr=nvim_treesitter#foldexpr()
" augroup END

" autocmd FileType tex set omnifunc=vimtex#complete#omnifunc

" pop ui
