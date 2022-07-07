#!/usr/bin/env bash

dir="~/.config/rofi"
rofi_command="rofi -theme $dir/themes/powermenu_theme.rasi"

# Options
# shutdown=" Shutdown"
# reboot=" Restart"
# lock=" Lock"
# sleep=" Sleep"
# logout=" Logout"

shutdown="";        # "\uE9C0"
reboot="";          # "\uE9C4"
sleep="";           # "\uE9A3"
logout="";          # "\uE991"
lock="";            # "\uE98F"

# Variable passed to rofi
options="$suspend\n$logout\n$lock\n$reboot\n$shutdown"

chosen="$(echo -e "$options" | $rofi_command -p "Power Options" -dmenu -selected-row 0)"
case "$(printf "lock\\nsuspend\\nhibernate\\nlogout\\nreboot\\npoweroff" | dmenu -nb '#000000' -sf '#f8f8f2' -sb '#6272a4' -nf '#f8f8f2' -fn 'hack nerd font:size=9' -h 34-i -p "⏻ ")" in
	lock) xscreensaver-command -lock ;;
	suspend) systemctl suspend ;;
	hibernate) systemctl hibernate ;;
	logout) bspc quit ;;
	reboot) systemctl reboot ;;
	poweroff) systemctl poweroff ;;
esac