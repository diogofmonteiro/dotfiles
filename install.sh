#!/bin/bash
#  ███╗   ███╗██╗   ██╗    ██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗     ███████╗██████╗ 
#  ████╗ ████║╚██╗ ██╔╝    ██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║     ██╔════╝██╔══██╗
#  ██╔████╔██║ ╚████╔╝     ██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║     █████╗  ██████╔╝
#  ██║╚██╔╝██║  ╚██╔╝      ██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║     ██╔══╝  ██╔══██╗
#  ██║ ╚═╝ ██║   ██║       ██║██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗███████╗██║  ██║
#  ╚═╝     ╚═╝   ╚═╝       ╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝                                                               
#
#	Author	-	diogofmonteiro
#	Email	-   diogofmonteiro@protonmail.com
#	Repo	-	https://github.com/diogofmonteiro/dotfiles
#	License	-	GPL-3.0
#	Created	-	2021-05-17 08:58:16
#	Updated	-	2025-05-17 08:58:16
#   Script to install my dotfiles
#
# Copyright (C) 2021-2025 diogofmonteiro <diogofmonteiro@protonmail.com>
# Licensed under GPL-3.0 license

echo "Linking config files..."

mkdir -p ~/.config/{bspwm,polybar,picom,nvim}

ln -sf "$PWD/bspwm/bspwmrc" ~/.config/bspwm/bspwmrc
ln -sf "$PWD/bspwm/sxhkdrc" ~/.config/bspwm/sxhkdrc
ln -sf "$PWD/polybar/config.ini" ~/.config/polybar/config.ini
ln -sf "$PWD/polybar/launch.sh" ~/.config/polybar/launch.sh
ln -sf "$PWD/picom/picom.conf" ~/.config/picom/picom.conf
ln -sf "$PWD/nvim/init.lua" ~/.config/nvim/init.lua
ln -sf "$PWD/zsh/.zshrc" ~/.zshrc
ln -sf "$PWD/x11/.xinitrc" ~/.xinitrc
ln -sf "$PWD/x11/.Xresources" ~/.Xresources

chmod +x ~/.config/bspwm/bspwmrc
chmod +x ~/.config/bspwm/sxhkdrc
chmod +x ~/.config/polybar/launch.sh

echo "Done."
