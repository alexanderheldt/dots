" CoC extensions
let g:coc_global_extensions = [
    \ 'coc-tsserver',
    \ 'coc-json',
    \ 'coc-eslint',
    \ 'coc-rust-analyzer'
    \]

" Airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'minimalist'

" nerdtree
let g:NERDTreeWinSize=50

" vimwiki
let g:vimwiki_url_maxsave=0

autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')
