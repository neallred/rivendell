# ~/.bashrc

OS=`uname -s`
HISTSIZE=4096
stty -ixon

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -f $HOME/.environment_variables ]; then
    source $HOME/.environment_variables
fi

PS1='natλ\w $ '

set -o vi

export VISUAL=vim
export EDITOR="$VISUAL"

alias grep="grep -I --color=auto"
alias vim="vim -O $@"
alias v="vim -O . $@"
alias lst="ls -halt | head -15"
alias imladris="/usr/bin/git --git-dir=$HOME/.rivendell/ --work-tree=$HOME"
alias ttmux="tmux new-session \; split-window -v \; split-window -h \; split-window -h \; split-window -h \; attach"
alias findbig="du -m | rg \"^\d{5}\""

shopt -s cdspell
# shopt -s dirspell
# shopt -s direxpand

PACKAGE_MANAGER=""
PACKAGE_INSTALL=""

set_package_manager() {
  if command -v apt-get >/dev/null 2>&1; then
    PACKAGE_MANAGER="apt-get"
    PACKAGE_INSTALL="sudo apt-get install"

  elif command -v pacman >/dev/null 2>&1; then
    PACKAGE_MANAGER="pacman"
    PACKAGE_INSTALL="sudo pacman -S"

  elif command -v brew >/dev/null 2>&1; then
    PACKAGE_MANAGER="brew"
    PACKAGE_INSTALL="brew install"

  elif command -v yum >/dev/null 2>&1; then
    PACKAGE_MANAGER="yum"
    PACKAGE_INSTALL="sudo yum install"

  elif command -v nix-env >/dev/null 2>&1; then
    PACKAGE_MANAGER="nix-env"
    PACKAGE_INSTALL="nix-env install"

  else
    PACKAGE_MANAGER="unknown"
  fi
}

set_package_manager

warn_command_not_found() {
  if [ $PACKAGE_MANAGER = unknown ]; then
    echo
    echo "Could not find $@, perhaps try installing via your package manager."
    echo
  else
    echo
    echo "Could not find $@, perhaps try installing via:"
    echo $PACKAGE_INSTALL $@
    echo
  fi
}

# Linux environment setup
if [ $OS = Linux ]; then
  if command -v xbindkeys >/dev/null 2>&1; then
    xbindkeys -p
  else
    echo "$(warn_command_not_found xbindkeys)"
  fi

  export p_user="/home/$(whoami)"
	export TERMINAL=$TERM
  export PATH=`pwd`/bin:"$PATH"

  export LC_CTYPE=en_US.UTF-8
  export LC_ALL=en_US.UTF-8
  export LANG=en_US.UTF-8
  export LANGUAGE=en_US.UTF-8

	alias ls='ls --width=100 --color=auto'
	alias elinks="elinks -no-connect"
	alias lynx="lynx -vikeys"
fi

# Mac environment setup
if [ $OS = Darwin ]; then
    export p_user="/Users/$(whoami)"
	. $HOME/.bashrc_apple
fi

export p_repos_public="$p_user/repos_public"
export p_repos_work="$p_user/repos_work"

# NVM/Node setup
if [ $OS = Linux ] || [ $OS = Darwin ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

grep_opts_common=" \
  -R \
  -I \
  --color=auto \
  "

grep_opts_exclude=" \
  --exclude *.css.map \
  --exclude *.js.map \
  --exclude *.min.css \
  --exclude *.min.js \
  --exclude *.min.map \
  --exclude *.snap \
  --exclude *.svg \
  --exclude *.xml \
  --exclude test-report.xml \
  --exclude yarn-error.log \
  --exclude yarn.lock \
  "

grep_opts_exclude_dir=" \
  --exclude-dir .git \
  --exclude-dir .node-gyp \
  --exclude-dir .nvm \
  --exclude-dir build \
  --exclude-dir coverage \
  --exclude-dir dist \
  --exclude-dir images \
  --exclude-dir lib \
  --exclude-dir min \
  --exclude-dir node_modules \
  --exclude-dir node_modules.docker \
  --exclude-dir vendor \
  --exclude-dir vendor.docker \
  "

function smartgrep {
  pushd $1
  echo "searching $(pwd)"
  echo "----------------------------------"
  echo
  grep \
    $grep_opts_common \
    $grep_opts_exclude \
    $grep_opts_exclude_dir \
    "${@:2}" \
    ./
  popd
}

# smartgrep is meant to be used in functions like this:
# function grepproject {
#   smartgrep "$p_project_root/" "$@"
# }

alias ffind="find . | grep -v node_modules | grep -v coverage | grep -v docker $@"
alias googler="googler --url-handler lynx"

export PATH=$HOME/.local/bin:$PATH
export PATH=$PATH:$HOME/commands
export PATH=$PATH:~/.utils/arch/sound:~/.utils/arch/wireless:~/.utils/git
export PATH=$PATH:/usr/local/bin

export PATH=$PATH:~/self/manual_installs/


if [ -f $HOME/.bashrc_machine ]; then
    source $HOME/.bashrc_machine
fi
