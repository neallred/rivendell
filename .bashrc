# ~/.bashrc

OS=`uname -s`

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -f $HOME/.environment_variables ]; then
    source $HOME/.environment_variables
fi

PS1='\e[0;32mnat\e[0;36mλ\e[0;32m\w $ '

set -o vi

export PATH=$PATH:~/.utils/arch/sound:~/.utils/arch/wireless:~/.utils/git

# Linux environment setup
if [ $OS = Linux ]; then
	xbindkeys -p

	export TERMINAL=$TERM
  export PATH=`pwd`/bin:"$PATH"

  export LC_ALL=en_US.UTF-8
  export LANG=en_US.UTF-8
  export LANGUAGE=en_US.UTF-8
fi

alias grep="grep --color=auto"
alias vim="vim -O $@"
alias hrunner="clear && stack ghc $1 && $2"
alias lst="ls -halt"


alias imladris="/usr/bin/git --git-dir=$HOME/.rivendell/ --work-tree=$HOME"

# Linux aliases
if [ $OS = Linux ]; then
	alias ls='ls --width=100 --color=auto'
	alias elinks="elinks -no-connect"
	alias lynx="lynx -vikeys"
fi

if [ -f $HOME/.bashrc_machine ]; then
    source $HOME/.bashrc_machine
fi

# Mac environment setup
if [ $OS = Darwin ]; then
	. $HOME/.bashrc_apple
fi

# NVM/Node setup
if [ $OS = Linux ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
elif [ $OS = Darwin ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

export PATH=$HOME/.local/bin:$PATH
