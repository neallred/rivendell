#
# ~/.bashrc
#
OS=`uname -s`

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -f $HOME/.environment_variables ]; then
    source $HOME/.environment_variables
fi

PS1='@\w $ '

set -o vi

export PATH=$PATH:~/.utils/arch/sound:~/.utils/arch/wireless:~/.utils/git

# Linux environment setup
if [ $OS = Linux ]; then
	xbindkeys -p
	export NVM_DIR="$HOME/.nvm"
	[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

	export PATH=$PATH:~/manual_installs/endless-sky
	export TERMINAL=$TERM
  export PATH=`pwd`/depot_tools:"$PATH"
  export PATH=`pwd`/bin:"$PATH"

  export LC_ALL=en_US.UTF-8
  export LANG=en_US.UTF-8
  export LANGUAGE=en_US.UTF-8

	export DIRC=$HOME/github/choiceats
	export DIRCS=$HOME/github/choiceats-server
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

if [ -f $HOME/.bashrc_work ]; then
    source $HOME/.bashrc_work
fi

# Mac environment setup
if [ $OS = Darwin ]; then
	. $HOME/.bashrc_mac
fi

export PATH=$HOME/.local/bin:$PATH
