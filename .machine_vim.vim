nnoremap <Leader>o/ :call NeallredDir($p_cbhomes_root)<CR>
nnoremap <Leader>oh :call NeallredDir($p_cbhomes_html)<CR>
nnoremap <Leader>oc :call NeallredDir($p_cbhomes_css)<CR>
nnoremap <Leader>oj :call NeallredDir($p_cbhomes_js)<CR>
nnoremap <Leader>ol :call NeallredDir($p_learn)<CR>
nnoremap <Leader>oo :call NeallredDir()<CR>
" 
" function! NeallredDir(dirToOpen)
"   let base_dir=$HOME
" 
" 
"   if &ft ==# "netrw"
"     echom a:dirToOpen
"   else
" 	  execute "vs " . base_dir
"   endif
"  
" endfunction

" http://ivanbrennan.nyc/blog/2014/01/16/rigging-vims-netrw/
" https://github.com/tpope/vim-vinegar
 function! NeallredDir(dirToOpen)
   let base_dir=$HOME
   let trumm_dir=a:dirToOpen
 
 
"   if &ft ==# "netrw"
   if winnr('$') > 1
 	  execute "e " . trumm_dir
   else
 	  execute "vs " . trumm_dir
   endif
  
 endfunction
