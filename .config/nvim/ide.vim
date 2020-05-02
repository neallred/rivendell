nmap <silent> <C-p> <Plug>(coc-diagnostic-prev)
nmap <silent> <C-n> <Plug>(coc-diagnostic-next)

nmap <silent> <leader>id <Plug>(coc-definition)
nmap <silent> <leader>iy <Plug>(coc-type-definition)
nmap <silent> <leader>ii <Plug>(coc-implementation)
nmap <silent> <leader>ir <Plug>(coc-references)
" " nmap <silent> <leader>u <Plug>(coc-references)
" nmap <silent> <leader>il <Plug>(coc-action-code-lens-action)
" nnoremap <silent> K :call <SID>show_documentation()<CR>

" command! -nargs=0 Prettier :CocCommand prettier.formatFile
