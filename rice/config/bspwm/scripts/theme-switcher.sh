#!/usr/bin/env bash

# Theme switcher script
THEMES_DIR="$HOME/.config/bspwm/themes"
CURRENT_THEME="$HOME/.config/bspwm/current_theme"

# Check for arguments
if [ $# -lt 1 ]; then
    echo "Usage: $0 [japan|forest|sunset] [wallpaper_number]"
    echo "Example: $0 japan 1"
    exit 1
fi

# Theme name
selected_theme="$1"
wallpaper_number="${2:-1}"  # Default to 1 if not specified

# Validate theme
case "$selected_theme" in
    japan|forest|sunset)
        theme_path="$THEMES_DIR/$selected_theme"
        ;;
    *)
        echo "Invalid theme. Available themes: japan, forest, sunset"
        exit 1
        ;;
esac

# Source theme configuration
source "$theme_path/theme.sh"

# Function to reload polybar
reload_polybar() {
    # Kill all polybar instances
    killall -q polybar
    
    # Wait until the processes have been shut down
    while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
    
    # Launch polybar with new theme
    polybar -c "$theme_path/polybar/config.ini" -r main &
}

# Function to apply theme
apply_theme() {
    # Set BSPWM theme colors
    bspc config focused_border_color "$bspwm_fbc"
    bspc config normal_border_color "$bspwm_nbc"
    bspc config active_border_color "$bspwm_abc"
    bspc config presel_feedback_color "$bspwm_pfc"
    
    # Set BSPWM window settings
    bspc config border_width "$bspwm_border"
    bspc config window_gap "$bspwm_gap"
    bspc config split_ratio "$bspwm_sratio"

    # Set wallpaper
    feh --bg-fill "$wallpaper"

    # Update rofi theme
    mkdir -p "$HOME/.config/rofi"
    ln -sf "$theme_path/rofi/theme.rasi" "$HOME/.config/rofi/theme.rasi"

    # Reload polybar with new theme
    reload_polybar

    # Save current theme
    echo "$selected_theme" > "$CURRENT_THEME"

    # Notify user
    notify-send "Theme Changed" "Applied theme: $selected_theme"
}

# Apply the theme
apply_theme
