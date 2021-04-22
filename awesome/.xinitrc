#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Disable caps lock.
setxkbmap -option caps:escape

# Configure Java for non-reparenting window manager.
export _JAVA_AWT_WM_NONREPARENTING=1

# Launch compositor.
picom --no-fading-openclose --no-fading-destroyed-argb &

# Enable numlock.
#numlockx &

# Bind multimedia keys
xbindkeys &

# Start Workrave.
workrave &

# Allow BOINC to read keyboard/mouse movements.
xhost local:boinc

# Start keynav.
keynav &

# Launch the home assistant usage tracker.
$HOME/.local/scripts/home-assistant-report-computer-usage.sh &

# Launch Awesome WM.
exec awesome
