#!/bin/bash

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
source "$theme_path/theme.conf"

# Function to set BSPWM configurations
apply_theme() {
    # Set BSPWM theme colors
    bspc config focused_border_color "$focused_border"
    bspc config normal_border_color "$normal_border"
    bspc config active_border_color "$active_border"

    # Set wallpaper
    local wallpaper="$theme_path/wallpapers/$wallpaper_number.jpg"
    if [ -f "$wallpaper" ]; then
        feh --bg-fill "$wallpaper"
    else
        echo "Wallpaper not found: $wallpaper"
    fi

    # Save current theme
    echo "$selected_theme" > "$CURRENT_THEME"

    # Reload polybar
    $HOME/.config/polybar/launch.sh
}

# Apply the theme
apply_theme
