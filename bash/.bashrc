#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias drush='sudo -u http drush'

# Add git info to the prompt.
source ~/.git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWUPSTREAM=auto

PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

# Set VI mode.
set -o vi

# Show some pretty system information.
archey
