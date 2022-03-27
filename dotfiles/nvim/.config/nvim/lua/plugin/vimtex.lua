-- For inverse search
-- ref: https://dr563105.github.io/blog/skim-vimtex-setup/

vim.g.vimtex_view_method = "skim"
vim.g.tex_flavor= "latex"
vim.g.vimtex_view_skim_sync = 1
vim.g.vimtex_view_skim_activate = 0
vim.cmd([[
    let g:vimtex_quickfix_open_on_warning = 0
    let g:vimtex_quickfix_enabled = 1
    let g:vimtex_compiler_latexmk = {
    \ 'build_dir' : 'build',
    \ 'callback' : 1,
    \ 'continuous' : 1,
    \ 'executable' : 'latexmk',
    \ 'hooks' : [],
    \ 'options' : [
    \   '-verbose',
    \   '-shell-escape',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}
    let g:vimtex_quickfix_ignore_filters = [
      \ 'Underfull',
      \ 'Overfull',
      \ 'Package caption',
      \ 'LaTeX Warning',
      \ 'I found no'
      \]
]])
