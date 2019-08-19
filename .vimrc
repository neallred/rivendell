" BASIC SET OPTIONS
noremap <S-k> <NOP>
set autoread
set formatoptions+=j
set hidden
set history=1000
set magic
set nocompatible
set number
set numberwidth=1
set ruler
set scrolloff=5
set sidescrolloff=5
set splitright
set showmode
" if &encoding ==# 'latin1' && has('gui_running')
"   set encoding=utf-8
" endif
set encoding=utf-8
set fileencoding=utf-8

" chinese characters on line below

set path=$PWD/**

set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.jpeg,*.ttf
set wildignore+=*.pdf,*.psd
set wildignore+=*.xls,.*xlsx,*.doc,*.docx,*.ppt,*.pptx,*.odt
set wildignore+=*.zip,*.7z,*.gz,*.ZIP,*.rar,*.exe
set wildignore+=*.mp3,*.mp4,*.wav,*3.gp,*.webm,*.aiff,*.ogg,*.iso,*.m4a
set wildignore+=node_modules/*,DNKVD/*,choiceats/build/*,choiceats-server/build/*
set wildignore+=*\\tmp\\*,*.swp,*.swo,.git,.cabal-sandbox

set wildmenu
set wildmode=longest:full,full
set laststatus=2

" ENCRYPTION
set cryptmethod=blowfish2

" PATHOGEN
execute pathogen#infect()
call pathogen#helptags()
filetype plugin indent on

" COLORS
syntax on
set t_Co=256
set background=dark
colorscheme OceanicNext
highlight LineNr ctermfg=250 ctermbg=232
highlight Normal ctermfg=250 ctermbg=232
highlight VertSplit ctermfg=black ctermbg=240
highlight EndOfBuffer ctermfg=gray ctermbg=232
highlight SignColumn ctermfg=232 ctermbg=232
highlight ALEErrorSign ctermbg=232
highlight ALEWarningSign ctermbg=232

" 7 is near white
" 250 is a bit darker

" has great examples of setting background and foreground colors in vim:
" https://github.com/mhartington/oceanic-next/blob/master/colors/OceanicNext.vim

let g:jsx_ext_required = 0 " extends JSX highlighting to JS files

" LONG TABS
" set tabstop=4
" set softtabstop=4
" set shiftwidth=4
" set expandtab

" SHORT TABS
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" SEARCHING
set hlsearch
set incsearch


" LEADER
let mapleader="\<Space>"


" MACROS

"	" NAVIGATION IN FILES
inoremap jk <ESC>
inoremap Jk <ESC>
inoremap jK <ESC>
inoremap JK <ESC>
nnoremap <C-j> 26j
vnoremap <C-j> 26j
nnoremap <C-k> 26k
vnoremap <C-k> 26k

nnoremap <Space> <NOP>
nnoremap <Leader>, :ArgWrap<CR>
nnoremap <Leader>vim :source $MYVIMRC<CR>

" " NAVIGATION BETWEEN FILES
" nnoremap <Leader>gf *ggnf.gf<CR>
nnoremap ge *:e <C-R>0<CR>

" find word at top of file where imports are, find the path part, and jump to the file
"

" command -complete=file -nargs=1 FS edit **/*<args>
" command -nargs=1 FSS split **/*
" command -nargs=1 FSV splitv **/*
autocmd BufWinEnter <buffer> wincmd L
autocmd BufEnter * lcd %:p:h
" set autochdir


"	" BUFFER MANIPULATION
nnoremap <Leader>d :bd<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>W :!mkdir -p %:h<CR> :w<CR>
nnoremap <Leader>q :wq<CR>
nnoremap <Leader>Q :qall<CR>
nnoremap <Leader>n :bn<CR>
nnoremap <Leader>p :bN<CR>
" :w|%bd|e# <- original solution is this
nnoremap <Leader>k :w<CR>:%bd<CR>:e#<CR> " keep only the current buffer


"	" TEMPLATES
" nnoremap <silent> <leader>rrsfc :r ~/.vim/templates/react-stateless-functional-component.jsx<CR>
" nnoremap <silent> <leader>rrcc :r ~/.vim/templates/react-component-common.jsx<CR>
" nnoremap <silent> <leader>rrcv :r ~/.vim/templates/react-component-verbose.jsx<CR>
" rrtc assumes chai, sinon, mocha
" nnoremap <silent> <leader>rrtc :r ~/.vim/templates/react-tests-chai.js<CR> 
" nnoremap <silent> <leader>rrtt :r ~/.vim/templates/react-tests-tape.js<CR>
" nnoremap <silent> <leader>rrtj :r ~/.vim/templates/react-tests-jest.js<CR>
" nnoremap <silent> <leader>re   :r ~/.vim/templates/elm.elm<CR>
nnoremap <silent> <leader>rf   a<c-r>=expand("%:t:r")<ESC><ESC>
nnoremap <silent> <leader>rp   a<c-r>=expand("%:p:r:h")<ESC><ESC>

nnoremap <Leader>rc :call system('xclip', @")<CR>

" Janky, currently only supports whole lines
vnoremap <silent> <Leader>rc :w !xclip<CR><CR>

" Always pastes on a new line
nnoremap <Leader>rv :r !(command -v xclip && xclip -o \|\| pbpaste) <CR>



cnoremap <C-n> <Down>
cnoremap <C-p> <Up>

"	" SPELL CORRECTION
"	Javascript
iabbrev flase false
iabbrev ture true
iabbrev cosnt const
iabbrev fucntion function
iabbrev fucntion function
iabbrev deafult default

" Elm
iabbrev ipmort import
iabbrev modle model

" Haskell
iabbrev JUst Just
iabbrev Flase False
iabbrev Ture True
iabbrev NOthing Nothing
iabbrev derifing deriving

" other
iabbrev Serach Search
iabbrev serach search
iabbrev teh the

" FUGITIVE SETTINGS
autocmd BufReadPost fugitive://* set bufhidden=delete


" https://github.com/sdiehl/haskell-vim-proto
" Each of the sections can be copied into your existing config independent of
" the other ones.

" == basic ==

set autoindent
"set clipboard=unnamedplus,autoselect

set completeopt=menuone,menu,longest

set completeopt+=longest


set cmdheight=1

set statusline=
set statusline+=%#warningmsg#
set statusline+=%f
set statusline+=%=
set statusline+=%m
set statusline+=%*

" == ghc-mod ==

" map <silent> tw :GhcModTypeInsert<CR>
" map <silent> ts :GhcModSplitFunCase<CR>
" map <silent> tq :GhcModType<CR>
" map <silent> te :GhcModTypeClear<CR>

" == neco-ghc ==

let g:haskellmode_completion_ghc = 1
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc


nnoremap <Leader>os :call Notrw($p_self)<CR>
nnoremap <Leader>of :call Notrw($p_builder)<CR>
nnoremap <Leader>o/ :call Notrw($p_leadpages)<CR>
nnoremap <Leader>ol :call Notrw($p_leads)<CR>
nnoremap <Leader>oc :call Notrw($p_choiceats)<CR>
" like netrw, but not ;)
function! Notrw(dirToOpen)
" e.g use with nnoremap <Leader>o/ :call Notrw($p_root)<CR>

  if winnr('$') > 1
    execute "e " . a:dirToOpen
  else
    execute "vs " . a:dirToOpen
  endif

endfunction

" netrw: follow symlink and set working directory
autocmd CursorMoved silent *
  " short circuit for non-netrw files
  \ if &filetype == 'netrw' |
  \   call FollowSymlink() |
  \   call SetProjectRoot() |
  \ endif

if filereadable("~/.machine_vim.vim")
  source .machine_vim.vim
endif

let g:netrw_banner = 0
let g:netrw_list_hide= '.*\.swp$'

" If netrw fails to delete its buffers, use this.
autocmd FileType netrw setl bufhidden=delete

" == tabular ==

let g:haskell_tabular = 1

vmap a= :Tabularize /=<CR>
vmap a; :Tabularize /::<CR>
vmap a- :Tabularize /-><CR>
vmap a, :Tabularize /<-<CR>
vmap al :Tabularize /[\[\\|,]<CR>

" == elm ==
let g:elm_format_autosave = 1


" == ALE ==
let g:ale_fixers = {
\   'haskell': ['hlint'],
\   'python': ['isort'],
\   'javascript': ['prettier', 'eslint'],
\}
" \   'javascript': ['prettier', 'eslint'],

let g:ale_linters = {
\    'typescript': ['tslint', 'tsserver'],
\}

" == Python ==
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

let g:ale_fix_on_save = 1
let g:ale_open_list = 0

let g:ale_sign_column_always = 1
let g:ale_sign_error = 'ˌ'
let g:ale_sign_warning = 'ˌ'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:mix_format_on_save = 1

let g:coc_suggest_disable = 1

highlight ALEError ctermbg=none cterm=underline
highlight ALEWarning ctermbg=none cterm=underline

nnoremap <C-n> :ALENext<CR>
nnoremap <C-p> :ALEPrevious<CR>

nnoremap <Leader>os :call Notrw($p_self)<CR>
nnoremap <Leader>of :call Notrw($p_builder)<CR>
nnoremap <Leader>oo :call Notrw($p_foundry)<CR>
nnoremap <Leader>og :call Notrw($p_forge)<CR>
nnoremap <Leader>o/ :call Notrw($p_leadpages)<CR>
nnoremap <Leader>ol :call Notrw($p_leads)<CR>
nnoremap <Leader>or :call Notrw($p_repos_work)<CR>
nnoremap <Leader>oc :call Notrw($p_crucible)<CR>
nnoremap <Leader>om :call Notrw($p_mandrel)<CR>
nnoremap <Leader>ob :call Notrw($p_cloudburst)<CR>
nnoremap <Leader>gd :call CocAction("jumpDefinition")<CR>
nnoremap <Leader>f :FZF<CR>
nnoremap <Leader>i <Plug>(coc-diagnostic-prev)
nnoremap <Leader>u <Plug>(coc-diagnostic-next)
" nnoremap <Leader>u :call CocAction("coc-diagnostic-next")<CR>
" nnoremap <Leader>; :Buffers<CR>
" nnoremap <Tab> :Buffers<CR>
nnoremap <Leader>b :Buffers<CR>
" nnoremap g. <C-i>

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
nnoremap <Leader>a :Ack! 

" == Typescript ==
" dark red
" hi tsxTagName guifg=#E06C75
" 
" " orange
" hi tsxCloseString guifg=#F99575
" hi tsxCloseTag guifg=#F99575
" hi tsxAttributeBraces guifg=#F99575
" hi tsxEqual guifg=#F99575
" 
" " yellow
" hi tsxAttrib guifg=#F8BD7F cterm=italic
" 
" hi ReactState guifg=#C176A7
" hi ReactProps guifg=#D19A66
" hi Events ctermfg=204 guifg=#56B6C2
" hi ReduxKeywords ctermfg=204 guifg=#C678DD
" hi WebBrowser ctermfg=204 guifg=#56B6C2
" hi ReactLifeCycleMethods ctermfg=204 guifg=#D19A66
" 
" " light-grey
" hi tsxTypeBraces guifg=#999999
" " " dark-grey
" hi tsxTypes guifg=#666666
" 
" autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.jsx
" autocmd BufNewFile,BufRead *.ts,*.js set filetype=typescript.jsx
