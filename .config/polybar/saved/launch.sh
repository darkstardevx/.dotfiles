#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 0.2; done

# Launch Polybar
polybar -q left-mybar -c "$HOME/.config/polybar/config.ini" &
polybar -q right-mybar -c "$HOME/.config/polybar/config.ini" &

echo "Polybar Loaded"
