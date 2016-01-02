#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias drush='sudo -u http drush'
alias xx='xsel | xsel -b'
alias gb='git branch --all | grep'

# Add git info to the prompt.
source ~/.git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWUPSTREAM=auto

PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

# Drush bash completion
. /usr/local/src/drush/drush.complete.sh

# Set VI mode.
set -o vi

# Allow bash completion in sudo.
complete -cf sudo

# Use vim as default editor.
export EDITOR=vim

# Show some pretty system information.
archey3

# Temporarily allow to use Diffie-Hellman key exchange to access drupal.org repositories.
# https://www.drupal.org/node/2552319
export GIT_SSH_COMMAND='ssh -o KexAlgorithms=+diffie-hellman-group1-sha1'
