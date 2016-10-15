#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -f $HOME/.environment_variables ]; then
    . $HOME/.environment_variables
fi

PS1='@\W\$ '

set -o vi

export NVM_DIR="/home/nathaniel/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# aliases
alias ls='ls --color=auto'
alias elinks="elinks -no-connect"
alias lynx="lynx -vikeys"

alias imladris='/usr/bin/git --git-dir=/home/nathaniel/.rivendell/ --work-tree=/home/nathaniel'
