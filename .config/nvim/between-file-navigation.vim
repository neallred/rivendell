" Navigation between files 
" " like netrw, but not ;)

function! Notrw(dirToOpen)
" used in local-repos.vim
" e.g use with nnoremap <Leader>o/ :call Notrw($p_root)<CR>

  if winnr('$') > 1
    execute "e " . a:dirToOpen
  else
    execute "vs " . a:dirToOpen
  endif
endfunction
  
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>f :FZF<CR>

" " set path=$PWD/**
autocmd BufEnter * silent! lcd %:p:h

set hidden
nnoremap <Leader>n :bn<CR>
nnoremap <Leader>p :bN<CR>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W><C-L>

autocmd FileType netrw setl bufhidden=delete
