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

# Configure Java for non-reparenting window manager.
export _JAVA_AWT_WM_NONREPARENTING=1

# Launch compositor.
compton &

# Launch Awesome WM.
exec awesome
