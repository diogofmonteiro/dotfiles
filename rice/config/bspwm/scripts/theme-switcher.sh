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

# Function to apply theme
apply_theme() {
    local theme_script="$theme_path/$selected_theme"
    
    if [ ! -x "$theme_script" ]; then
        echo "Theme script not found or not executable: $theme_script"
        exit 1
    fi

    # Set wallpaper (wallpaper is set in theme script)
    if [ -f "$theme_path/wallpapers/${wallpaper_number}.jpg" ]; then
        feh --bg-fill "$theme_path/wallpapers/${wallpaper_number}.jpg"
    else
        echo "Wallpaper not found: $wallpaper_number.jpg"
        exit 1
    fi

    # Execute theme script
    "$theme_script"

    # Save current theme
    echo "$selected_theme" > "$CURRENT_THEME"

    # Notify user
    notify-send "Theme Changed" "Applied theme: $selected_theme"
}

# Apply the theme
apply_theme
