#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='@\W\$ '

set -o vi

# aliases
alias elinks="elinks -no-connect"
alias lynx="lynx -vikeys"

export NVM_DIR="/home/nathaniel/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
alias imladris='/usr/bin/git --git-dir=/home/nathaniel/.rivendell/ --work-tree=/home/nathaniel'
