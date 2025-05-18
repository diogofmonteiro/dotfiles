#!/usr/bin/env bash
#  ███████╗███████╗████████╗██╗   ██╗██████╗ 
#  ██╔════╝██╔════╝╚══██╔══╝██║   ██║██╔══██╗
#  ███████╗█████╗     ██║   ██║   ██║██████╔╝
#  ╚════██║██╔══╝     ██║   ██║   ██║██╔═══╝ 
#  ███████║███████╗   ██║   ╚██████╔╝██║     
#  ╚══════╝╚══════╝   ╚═╝    ╚═════╝ ╚═╝     
#  Author: diogofmonteiro
#  https://github.com/diogofmonteiro/dotfiles

CRE=$(tput setaf 1)
CYE=$(tput setaf 3)
CGR=$(tput setaf 2)
CBL=$(tput setaf 4)
BLD=$(tput bold)
CNC=$(tput sgr0)

backup_date=$(date +%Y%m%d_%H%M%S)
backup_dir="$HOME/.config.bak.$backup_date"

logo () {
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

# Install base packages
install_base_packages() {
    echo -e "${CBL}${BLD}Installing base packages...${CNC}"
    yay -S --noconfirm bspwm sxhkd polybar picom alacritty rofi feh dunst \
    xorg xorg-xinit git zsh neovim ttf-font-awesome ttf-jetbrains-mono \
    noto-fonts xclip || error "Failed to install base packages"
}

# Install full setup packages
install_extra_packages() {
    echo -e "${CBL}${BLD}Installing additional packages...${CNC}"
    yay -S --noconfirm gcc make cmake python nodejs docker visual-studio-code-bin \
    mpv ffmpeg pulseaudio pavucontrol firefox thunderbird libreoffice thunar \
    htop ncdu ranger networkmanager || error "Failed to install extra packages"
}

# Backup existing configs
backup_configs() {
    echo -e "${CBL}${BLD}Backing up existing configs to ${backup_dir}...${CNC}"
    if [ -d "$HOME/.config" ]; then
        mkdir -p "$backup_dir"
        cp -rf "$HOME/.config" "$backup_dir/"
    fi
}

# Create necessary directories
create_dirs() {
    echo -e "${CBL}${BLD}Creating config directories...${CNC}"
    mkdir -p "$HOME"/.config/{bspwm,sxhkd,polybar,alacritty,rofi,picom}
    mkdir -p "$HOME"/.config/bspwm/{scripts,rices}
    mkdir -p "$HOME"/.mozilla/firefox
    mkdir -p "$HOME"/.local/share/fonts
}

# Install configurations
install_configs() {
    echo -e "${CBL}${BLD}Installing configurations...${CNC}"
    
    # Copy configurations
    cp -rf rice/config/* "$HOME"/.config/
    cp -rf rice/themes/* "$HOME"/.config/bspwm/rices/
    cp -rf firefox/homepage "$HOME"/.mozilla/firefox/
    
    # Set executable permissions
    chmod +x "$HOME"/.config/bspwm/{bspwmrc,scripts/theme-switcher.sh}
    chmod +x "$HOME"/.config/polybar/launch.sh
}

# Set ZSH as default shell
setup_zsh() {
    echo -e "${CBL}${BLD}Setting up ZSH...${CNC}"
    if [ "$SHELL" != "/bin/zsh" ]; then
        chsh -s /bin/zsh
    fi
}

# Main function
main() {
    clear
    logo "Installation Script"
    
    # Welcome message
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
    
    # Install yay if not present
    if ! command -v yay &>/dev/null; then
        echo -e "\n${CBL}${BLD}Installing yay...${CNC}"
        git clone https://aur.archlinux.org/yay.git /tmp/yay
        (cd /tmp/yay && makepkg -si --noconfirm)
        rm -rf /tmp/yay
    fi
    
    backup_configs
    create_dirs
    install_base_packages
    
    if [ "$option" = "2" ]; then
        install_extra_packages
    fi
    
    install_configs
    setup_zsh
    
    # Set default theme
    "$HOME"/.config/bspwm/scripts/theme-switcher.sh japan
    
    echo -e "\n${CGR}${BLD}Installation completed successfully!${CNC}"
    echo -e "${CYE}${BLD}Please log out and log back in to apply all changes.${CNC}"
}

main "$@"
