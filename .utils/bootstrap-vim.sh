# PATHOGEN.
# This section must come first
mkdir -p ~/.vim/autoload ~/.vim/bundle
cd ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
git clone https://github.com/tpope/vim-pathogen.git

# BUFFERS / NAVIGATION / FILESYSTEM
git clone https://github.com/junegunn/fzf.git
echo "fzf requires running the ./install script contained in its root directory"
git clone https://github.com/junegunn/fzf.vim.git
git clone https://github.com/tpope/vim-eunuch.git

# COLORS
git clone https://github.com/mhartington/oceanic-next.git

# ELM
git clone https://github.com/ElmCast/elm-vim.git

# GIT
git clone https://github.com/tpope/vim-fugitive.git

# JS
git clone https://github.com/mxw/vim-jsx
git clone https://github.com/pangloss/vim-javascript.git

# LINT / FORMATTING
git clone https://github.com/w0rp/ale.git
git clone https://github.com/FooSoft/vim-argwrap.git
git clone https://github.com/godlygeek/tabular.git
