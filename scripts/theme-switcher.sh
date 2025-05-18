#!/usr/bin/env bash

# Theme switcher script
export THEME_DIR="$HOME/.config/bspwm/themes"
export CURRENT_THEME="$HOME/.config/bspwm/current_theme"

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
        theme_path="$THEME_DIR/$selected_theme"
        ;;
    *)
        echo "Invalid theme. Available themes: japan, forest, sunset"
        exit 1
        ;;
esac

# Source theme configuration
source "$theme_path/theme.conf"

# Function to set BSPWM configurations
set_bspwm_config() {
    bspc config border_width "$bspwm_border_width"
    bspc config window_gap "$bspwm_window_gap"
    bspc config normal_border_color "$normal_border"
    bspc config active_border_color "$active_border"
    bspc config focused_border_color "$focused_border"
    
    if [ "$bspwm_monocle_padding" ]; then
        bspc config left_padding "$bspwm_monocle_padding"
        bspc config right_padding "$bspwm_monocle_padding"
        bspc config bottom_padding "$bspwm_monocle_padding"
        bspc config top_padding "$bspwm_monocle_padding"
    fi
}

# Function to change wallpaper
set_wallpaper() {
    local theme="$1"
    local number="$2"
    local wallpaper="$THEME_DIR/$theme/wallpapers/$number.jpg"
    
    if [ -f "$wallpaper" ]; then
        feh --bg-fill "$wallpaper"
    else
        echo "Wallpaper not found: $wallpaper"
        exit 1
    fi
}

# Apply configurations
apply_theme() {
    # Set BSPWM configurations
    set_bspwm_config
    
    # Set wallpaper
    set_wallpaper "$selected_theme" "$wallpaper_number"
    
    # Update theme manager configuration
    "$HOME/.config/bspwm/themes/theme_manager.sh" "$selected_theme"
    
    # Save current theme
    echo "$selected_theme" > "$CURRENT_THEME"
    
    # Restart polybar
    "$HOME/.config/polybar/launch.sh"
}

# Execute theme change
apply_theme

# Notify user
notify-send "Theme Changed" "Applied theme: $selected_theme"
