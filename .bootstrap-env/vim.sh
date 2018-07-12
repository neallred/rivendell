# PATHOGEN.
# This section must come first
mkdir -p ~/.vim/autoload ~/.vim/bundle
cd ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
git clone https://github.com/tpope/vim-pathogen.git

# COLORS
git clone https://github.com/mhartington/oceanic-next.git

# ELM
git clone https://github.com/ElmCast/elm-vim.git

# GIT
git clone https://github.com/tpope/vim-fugitive.git

# HASKELL
git clone https://github.com/neovimhaskell/haskell-vim.git

# JENKINS
git clone https://github.com/martinda/Jenkinsfile-vim-syntax.git

# JS
git clone https://github.com/mxw/vim-jsx
git clone https://github.com/pangloss/vim-javascript.git

# LINT / FORMATTING
git clone https://github.com/w0rp/ale.git
git clone https://github.com/FooSoft/vim-argwrap.git
git clone https://github.com/godlygeek/tabular.git

# BUFFERS / NAVIGATION / FILESYSTEM
git clone https://github.com/junegunn/fzf.git

echo ""
echo "|---------------------------------------------------------------------------|"
echo "| fzf requires running the ./install script contained in its root directory |"
echo "|---------------------------------------------------------------------------|"
echo "  pushd ~/.vim/bundle/fzf/ && ./install && popd                              "
echo "|---------------------------------------------------------------------------|"
echo ""

git clone https://github.com/junegunn/fzf.vim.git
git clone https://github.com/tpope/vim-eunuch.git
