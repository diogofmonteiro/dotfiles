#!/bin/bash

echo "Installing packages..."

sudo pacman -Syu --noconfirm \
  bspwm sxhkd polybar picom neovim zsh git rofi alacritty xorg xorg-xinit \
  ttf-font-awesome noto-fonts xclip

chsh -s /bin/zsh

echo "Cloning dotfiles..."
git clone https://github.com/YOUR_USERNAME/dotfiles.git ~/dotfiles
cd ~/dotfiles && ./install.sh
