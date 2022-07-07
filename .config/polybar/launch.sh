#!/bin/bash
# Polybar launch configuration
#
# Terminate already running bar instances
killall -q polybar

# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 0.2; done

# Launch Polybar(s)
polybar -q left-mybar -c "$HOME/.config/polybar/config.ini" | tee -a /tmp/polybar-left-mybar.log &
polybar -q right-mybar -c "$HOME/.config/polybar/config.ini" | tee -a /tmp/polybar-right-mybar.log &

echo "Polybar Loaded"
echo "Log Files located in /tmp"
