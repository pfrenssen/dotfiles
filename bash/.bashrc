#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PATH="/home/pieter/.cargo/bin:$(ruby -e 'print Gem.user_dir')/bin:$PATH"

alias ls='ls --color=auto'
alias xx='xsel | xsel -b'

alias vdb='./vendor/bin/phing'
alias bi='xdebugoff && ./vendor/bin/drush cr && rm -rf ./web/core/ && ./vendor/bin/composer install --prefer-source && ./vendor/bin/run toolkit:build-dev && ./vendor/bin/run toolkit:install-clean && ./vendor/bin/drush cset system.logging error_level --value=verbose --yes && ./vendor/bin/drush cr'

#alias selenium-debug='docker run -d -p 4444:4444 -p 5900:5900 --network=bridge --add-host=joinup.local:172.17.0.1 selenium/standalone-chrome-debug && sleep 5 && vncviewer 127.0.0.1:5900 --passwd=/home/pieter/.vnc/passwd &'
#alias selenium='docker run -d -p 4444:4444 --network=host selenium/standalone-chrome'
alias selenium-debug='docker run -d -p 4444:4444 -p 5900:5900 --network=host selenium/standalone-chrome-debug:3.11 && sleep 1 && vncviewer 127.0.0.1:5900 --passwd=/home/pieter/.vnc/passwd'
alias selenium='docker run -d -p 4444:4444 --network=host selenium/standalone-chrome:3.11'

alias gb='git branch --all | grep'

alias xdebugoff="sed 's/^zend_extension/;zend_extension/' /etc/php74/conf.d/xdebug.ini | sudo tee /etc/php74/conf.d/xdebug.ini &> /dev/null; sudo systemctl restart httpd"
alias xdebugon="sed 's/^;zend_extension/zend_extension/' /etc/php74/conf.d/xdebug.ini | sudo tee /etc/php74/conf.d/xdebug.ini &> /dev/null; sudo systemctl restart httpd"

alias fixsteam="find ~/.steam/root/ \\( -name \"libgcc_s.so*\" -o -name \"libstdc++.so*\" -o -name \"libxcb.so*\" -o -name \"libgpg-error.so*\" \\) -print -delete"
alias chromium='chromium --high-dpi-support=1 --force-device-scale-factor=1'

# Add git info to the prompt.
source ~/.git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWUPSTREAM=auto

PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

# Set VI mode.
set -o vi

# Allow bash completion in sudo.
complete -cf sudo

# Use vim as default editor.
export EDITOR=vim

# Allow Composer to use as much memory as it needs.
export COMPOSER_MEMORY_LIMIT=-1

# Show some pretty system information.
fastfetch
