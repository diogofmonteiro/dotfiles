#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Load the bar
source $HOME/.config/bspwm/current_theme
theme_config="$HOME/.config/bspwm/themes/$THEME/theme.conf"

if [ -f "$theme_config" ]; then
    source "$theme_config"
    MONITOR=$(polybar -m|tail -1|sed -e 's/:.*$//g') polybar main 2>&1 | tee -a /tmp/polybar.log & disown
else
    echo "Theme configuration not found: $theme_config"
    exit 1
fi

echo "Polybar launched..."
