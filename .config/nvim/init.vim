call plug#begin('~/.local/share/nvim/plugged')
Plug 'FooSoft/vim-argwrap'
" Plug 'alx741/vim-hindent'
" Plug 'derekwyatt/vim-scala'
" Plug 'ervandew/supertab' 
" Plug 'godlygeek/tabular'
" Plug 'janko/vim-test'
Plug 'junegunn/fzf' , { 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
" Plug 'othree/csscomplete.vim', { 'for': ['css', 'sass', 'scss'] }

" PYTHON
" Plug 'klen/python-mode'
" Plug 'python/black'

" Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
" Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'

" COLORS
" Plug 'Lokaltog/vim-monotone'
" Plug 'fxn/vim-monochrome'
Plug 'mhartington/oceanic-next'
" Plug 'xero/blaquemagick.vim'

call plug#end()
set nocompatible

" let g:python_host_prog='/usr/bin/python2'
" let g:python3_host_prog='/home/nathaniel/.pyenv/shims/python3'
" set autoread
" filetype plugin indent on
" filetype plugin indent on

let mapleader="\<Space>"
let g:mapleader = "\<Space>"

nnoremap <Leader>vim :source $MYVIMRC<CR>
" 
nnoremap <Leader>w :w<CR>
" 
nnoremap <Leader>k :w<CR>:%bd<CR>:e#<CR> " keep only the current buffer
" 
"
function! SourceIfExists(file)
  if filereadable(expand(a:file))
    exe 'source' a:file
  endif
endfunction

let configdir = "~/.config/nvim/"
function! AddConfigDir(x)
  return g:configdir . a:x
endfunction

function! Mapped(fn, l)
    let new_list = deepcopy(a:l)
    call map(new_list, string(a:fn) . '(v:val)')
    return new_list
endfunction

let files_to_source = Mapped(function("AddConfigDir"), [
  \"between-file-navigation.vim",
  \"colors.vim",
  \"complete-bar.vim",
  \"copy-paste.vim",
  \"de-vim.vim",
  \"ide.vim",
  \"in-file-navigation.vim",
  \"layouts.vim",
  \"local-repos.vim",
  \"spell-correction.vim",
  \"whitespace.vim",
\])
 " load after between-file-navigation
let language_files_to_source = [
  \"~/.config/nvim/javascript.vim",
\]

for x in files_to_source
  call SourceIfExists(x)
endfor

for x in language_files_to_source
  call SourceIfExists(x)
endfor
