#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"

alias ls='ls --color=auto'
alias xx='xsel | xsel -b'

alias vdb='./vendor/bin/phing'
alias bi='xdebugoff && ./vendor/bin/phing build-dev && ./vendor/bin/phing install-dev'
alias selenium-debug='docker run -d -p 4444:4444 -p 5900:5900 --network=host selenium/standalone-chrome-debug && sleep 1 && vncviewer 127.0.0.1:5900 --passwd=/home/pieter/.vnc/passwd'
alias selenium='docker run -d -p 4444:4444 --network=host selenium/standalone-chrome'

alias gb='git branch --all | grep'

alias xdebugoff="sed 's/^zend_extension/;zend_extension/' /etc/php/conf.d/xdebug.ini | sudo tee /etc/php/conf.d/xdebug.ini &> /dev/null; sudo systemctl restart httpd"
alias xdebugon="sed 's/^;zend_extension/zend_extension/' /etc/php/conf.d/xdebug.ini | sudo tee /etc/php/conf.d/xdebug.ini &> /dev/null; sudo systemctl restart httpd"

alias fixsteam="find ~/.steam/root/ \\( -name \"libgcc_s.so*\" -o -name \"libstdc++.so*\" -o -name \"libxcb.so*\" -o -name \"libgpg-error.so*\" \\) -print -delete"

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
