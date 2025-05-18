#!/bin/bash
#
# Arch Linux Dotfiles Installation Script
# Author: diogofmonteiro
# License: GPL-3.0

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Installation type packages
declare -a BASE_PACKAGES=(
    "bspwm"
    "sxhkd"
    "polybar"
    "picom"
    "neovim"
    "zsh"
    "git"
    "rofi"
    "alacritty"
    "xorg"
    "xorg-xinit"
    "ttf-font-awesome"
    "noto-fonts"
    "xclip"
)

declare -a FULL_PACKAGES=(
    "gcc"
    "make"
    "cmake"
    "python"
    "nodejs"
    "docker"
    "visual-studio-code-bin"
    "mpv"
    "feh"
    "ffmpeg"
    "pulseaudio"
    "pavucontrol"
    "firefox"
    "thunderbird"
    "libreoffice"
    "thunar"
    "htop"
    "ncdu"
    "ranger"
    "dunst"
    "networkmanager"
)

# Log file
LOG_FILE="/tmp/dotfiles_install.log"

# Helper functions
log() {
    echo -e "${BLUE}[INFO]${NC} $1"
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" >> "$LOG_FILE"
}

error() {
    echo -e "${RED}[ERROR]${NC} $1" >&2
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] ERROR: $1" >> "$LOG_FILE"
    exit 1
}

success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] SUCCESS: $1" >> "$LOG_FILE"
}

# Check if running on Arch Linux
check_arch() {
    if [ ! -f "/etc/arch-release" ]; then
        error "This script must be run on Arch Linux"
    fi
}

# Check for internet connection
check_internet() {
    log "Checking internet connection..."
    if ! ping -c 1 archlinux.org &>/dev/null; then
        error "No internet connection available"
    fi
}

# Install yay AUR helper
install_yay() {
    if ! command -v yay &>/dev/null; then
        log "Installing yay AUR helper..."
        git clone https://aur.archlinux.org/yay.git /tmp/yay
        (cd /tmp/yay && makepkg -si --noconfirm) || error "Failed to install yay"
        rm -rf /tmp/yay
    fi
}

# Backup existing configs
backup_configs() {
    local backup_dir="$HOME/.config.bak.$(date +%Y%m%d_%H%M%S)"
    log "Backing up existing configs to $backup_dir..."
    
    if [ -d "$HOME/.config" ]; then
        mkdir -p "$backup_dir"
        cp -r "$HOME/.config" "$backup_dir/"
    fi
}

# Install packages based on selection
install_packages() {
    local install_type=$1
    local packages=("${BASE_PACKAGES[@]}")

    if [ "$install_type" = "full" ]; then
        packages+=("${FULL_PACKAGES[@]}")
    fi

    log "Installing packages..."
    yay -Syu --noconfirm "${packages[@]}" || error "Failed to install packages"
}

# Create necessary directories
create_dirs() {
    log "Creating config directories..."
    mkdir -p "$HOME/.config"/{bspwm,polybar,picom,nvim,alacritty,rofi}
    mkdir -p "$HOME/.config/bspwm/themes"
    mkdir -p "$HOME/.config/bspwm/scripts"
    mkdir -p "$HOME/.mozilla/firefox"
}

# Setup themes
setup_themes() {
    log "Setting up themes..."
    
    # Copy theme files
    cp -r "$PWD/bspwm/themes"/* "$HOME/.config/bspwm/themes/"
    
    # Copy theme switcher script
    cp "$PWD/scripts/theme-switcher.sh" "$HOME/.config/bspwm/scripts/"
    chmod +x "$HOME/.config/bspwm/scripts/theme-switcher.sh"
    
    # Copy theme shortcuts
    cp "$PWD/bspwm/theme_shortcuts" "$HOME/.config/bspwm/"
    chmod +x "$HOME/.config/bspwm/theme_shortcuts"
    
    # Install feh for wallpaper management
    yay -S --noconfirm feh
    
    # Set default theme
    "$HOME/.config/bspwm/scripts/theme-switcher.sh" japan
}

# Symlink configuration files
link_configs() {
    log "Linking configuration files..."
    
    local configs=(
        "bspwm/bspwmrc:$HOME/.config/bspwm/bspwmrc"
        "bspwm/sxhkdrc:$HOME/.config/bspwm/sxhkdrc"
        "config/polybar/config.ini:$HOME/.config/polybar/config.ini"
        "config/polybar/launch.sh:$HOME/.config/polybar/launch.sh"
        "config/picom/picom.conf:$HOME/.config/picom/picom.conf"
        "config/alacritty/colors.yml:$HOME/.config/alacritty/colors.yml"
        "config/rofi/colors.rasi:$HOME/.config/rofi/colors.rasi"
    )

    for config in "${configs[@]}"; do
        IFS=':' read -r src dest <<< "$config"
        ln -sf "$PWD/$src" "$dest" || error "Failed to link $src"
    }

    # Set executable permissions
    chmod +x "$HOME/.config/bspwm/bspwmrc"
    chmod +x "$HOME/.config/bspwm/sxhkdrc"
    chmod +x "$HOME/.config/polybar/launch.sh"
}

# Set up ZSH as default shell
setup_zsh() {
    log "Setting up ZSH..."
    if [ "$SHELL" != "/bin/zsh" ]; then
        chsh -s /bin/zsh || error "Failed to change shell to ZSH"
    fi
}

# Main installation function
main() {
    # Clear or create log file
    > "$LOG_FILE"
    
    log "Starting dotfiles installation..."
    
    # System checks
    check_arch
    check_internet
    
    # Prompt for installation type
    echo "Select installation type:"
    echo "1. Minimal (basic WM and essential tools)"
    echo "2. Full (includes development tools and additional applications)"
    read -p "Enter choice (1-2): " install_choice
    
    case $install_choice in
        1) install_type="minimal" ;;
        2) install_type="full" ;;
        *) error "Invalid selection" ;;
    esac
    
    # Installation steps
    backup_configs
    install_yay
    install_packages "$install_type"
    create_dirs
    link_configs
    setup_zsh
    
    # Setup themes
    setup_themes
    
    success "Installation completed successfully!"
    log "Please log out and log back in to apply all changes."
}

# Run main function
main "$@"
