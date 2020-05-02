call plug#begin('~/.local/share/nvim/plugged')
Plug 'FooSoft/vim-argwrap'
" Plug 'alx741/vim-hindent'
" Plug 'janko/vim-test'
Plug 'junegunn/fzf' , { 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
"
" GO
Plug 'fatih/vim-go'

Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
Plug 'tpope/vim-eunuch'

" PYTHON
" Plug 'klen/python-mode'
" Plug 'python/black'

Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'

" COLORS
Plug 'mhartington/oceanic-next'

Plug 'hwayne/tla.vim'

call plug#end()
set nocompatible

" set autoread
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

 " load local-repos.vim after between-file-navigation
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
let language_files_to_source = [
  \"~/.config/nvim/javascript.vim",
  \"~/.config/nvim/go.vim",
\]

for x in files_to_source
  call SourceIfExists(x)
endfor

for x in language_files_to_source
  call SourceIfExists(x)
endfor
set completeopt-=preview
