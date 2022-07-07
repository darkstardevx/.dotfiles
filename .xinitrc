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

[[ -z $(pgrep -xU $UID mpdscribble) ]] && mpdscribble &

# Pywal Colorscheme
# -R restores the last colorscheme that was in use.
wal -R

xbindkeys &

# set up a desktop where all windows are floating
# change the desktop number here
FLOATING_DESKTOP_ID=$(bspc query -D -d '^15')

bspc subscribe node_add | while read -a msg ; do
	desk_id=${msg[2]}
	wid=${msg[4]}
	[ "FLOATING_DESKTOP_ID" = "desk_id" ] && bspc node "$wid" -t
floating
done &

# For IntelliJ Programs
export _JAVA_AWT_WM_NONREPARENTING=1