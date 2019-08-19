nnoremap <Leader>rc :call system('xclip', @")<CR>
" Janky, currently only supports whole lines
vnoremap <silent> <Leader>rc :w !xclip<CR><CR>
" Always pastes on a new line
nnoremap <Leader>rv :r !xclip -o<CR>

