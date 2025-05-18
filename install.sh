#!/usr/bin/env bash

# Colors for output
CRE=$(tput setaf 1)
CGR=$(tput setaf 2)
CYE=$(tput setaf 3)
CBL=$(tput setaf 4)
BLD=$(tput bold)
CNC=$(tput sgr0)

# Logo function
logo() {
    local text="${1:?}"
    echo -en "
    ██████╗ ███████╗███████╗██╗  ██╗████████╗ ██████╗ ██████╗ 
    ██╔══██╗██╔════╝██╔════╝██║ ██╔╝╚══██╔══╝██╔═══██╗██╔══██╗
    ██║  ██║█████╗  ███████╗█████╔╝    ██║   ██║   ██║██████╔╝
    ██║  ██║██╔══╝  ╚════██║██╔═██╗    ██║   ██║   ██║██╔═══╝ 
    ██████╔╝███████╗███████║██║  ██╗   ██║   ╚██████╔╝██║     
    ╚═════╝ ╚══════╝╚══════╝╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚═╝     
                $text
    "
}

# Base packages needed
declare -a BASE_PACKAGES=(
    "bspwm"
    "sxhkd"
    "polybar"
    "picom"
    "alacritty"
    "rofi"
    "feh"
    "dunst"
    "git"
    "zsh"
    "neovim"
    "ttf-jetbrains-mono"
    "ttf-font-awesome"
    "xorg"
    "xorg-xinit"
)

# Full installation packages
declare -a EXTRA_PACKAGES=(
    "firefox"
    "thunar"
    "ranger"
    "neofetch"
    "htop"
    "mpv"
    "pamixer"
    "pulseaudio"
    "pavucontrol"
    "wireless_tools"
    "networkmanager"
)

# Backup existing configs
backup_configs() {
    local backup_dir="$HOME/.config.bak.$(date +%Y%m%d_%H%M%S)"
    echo -e "${CBL}${BLD}Creating backup of existing configs in $backup_dir${CNC}"
    
    if [ -d "$HOME/.config" ]; then
        mkdir -p "$backup_dir"
        cp -rf "$HOME/.config" "$backup_dir/"
    fi
}

# Install base packages
install_packages() {
    echo -e "\n${CBL}${BLD}Installing base packages...${CNC}"
    
    # Install yay if not present
    if ! command -v yay &>/dev/null; then
        echo -e "\n${CBL}${BLD}Installing yay...${CNC}"
        git clone https://aur.archlinux.org/yay.git /tmp/yay
        (cd /tmp/yay && makepkg -si --noconfirm)
        rm -rf /tmp/yay
    fi
    
    # Install packages
    yay -S --needed --noconfirm "${BASE_PACKAGES[@]}"
    
    if [ "$1" = "full" ]; then
        echo -e "\n${CBL}${BLD}Installing extra packages...${CNC}"
        yay -S --needed --noconfirm "${EXTRA_PACKAGES[@]}"
    fi
}

# Create necessary directories
create_dirs() {
    echo -e "\n${CBL}${BLD}Creating config directories...${CNC}"
    mkdir -p "$HOME"/.config/{bspwm,sxhkd,polybar,alacritty,rofi,picom}
    mkdir -p "$HOME"/.config/bspwm/{scripts,rices}
    mkdir -p "$HOME"/.local/share/fonts
}

# Install configurations
install_configs() {
    echo -e "\n${CBL}${BLD}Installing configurations...${CNC}"
    
    # Copy configurations
    cp -rf rice/config/* "$HOME"/.config/
    
    # Set executable permissions
    chmod +x "$HOME"/.config/bspwm/{bspwmrc,scripts/theme-switcher.sh}
    chmod +x "$HOME"/.config/bspwm/rices/*/{japan,forest,sunset,workspaces.sh}
    
    # Set default theme
    echo "japan" > "$HOME"/.config/bspwm/current_theme
}

# Main function
main() {
    clear
    logo "Installation Script"
    
    echo -e "${CBL}${BLD}Welcome to the installation script!${CNC}"
    echo -e "${CYE}This script will install and configure your desktop environment.${CNC}"
    
    read -p $'\n'"${CRE}${BLD}[!]${CNC} Proceed with installation? (y/N): " answer
    
    if [[ ! $answer =~ ^[Yy]$ ]]; then
        echo -e "\n${CRE}${BLD}Installation cancelled.${CNC}"
        exit 1
    fi
    
    echo -e "\n${CGR}${BLD}Select installation type:${CNC}"
    echo -e "1) Minimal Installation"
    echo -e "2) Full Installation\n"
    read -p "${CRE}${BLD}[!]${CNC} Enter option (1 or 2): " option
    
    case $option in
        1) install_type="minimal" ;;
        2) install_type="full" ;;
        *) 
            echo -e "\n${CRE}${BLD}Invalid option.${CNC}"
            exit 1
            ;;
    esac
    
    backup_configs
    install_packages "$install_type"
    create_dirs
    install_configs
    
    echo -e "\n${CGR}${BLD}Installation completed successfully!${CNC}"
    echo -e "${CYE}${BLD}Please log out and log back in to apply all changes.${CNC}"
}

main "$@"
