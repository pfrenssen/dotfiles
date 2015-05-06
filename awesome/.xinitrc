#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# Load X defaults.
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# Disable caps lock.
setxkbmap -option caps:none

# Launch compositor.
compton &

# Launch Awesome WM.
exec awesome
