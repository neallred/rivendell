#
# ~/.bashrc
#
OS=`uname -s`

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -f $HOME/.environment_variables ]; then
    . $HOME/.environment_variables
fi

PS1='@\w $ '

set -o vi

export PATH=$PATH:~/.utils/arch/sound:~/.utils/arch/wireless:~/.utils/git

# Linux environment setup
if [ $OS = Linux ]; then
	xbindkeys -p
	export NVM_DIR="/home/nathaniel/.nvm"
	[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

	export PATH=$PATH:~/manual_installs/endless-sky
fi


# Linux aliases
if [ $OS = Linux ]; then
	alias imladris='/usr/bin/git --git-dir=/home/nathaniel/.rivendell/ --work-tree=/home/nathaniel'
	alias ls='ls --color=auto'
	alias elinks="elinks -no-connect"
	alias lynx="lynx -vikeys"
fi

# Mac environment setup
if [ $OS = Darwin ]; then
	. $HOME/.bashrc_mac
fi
