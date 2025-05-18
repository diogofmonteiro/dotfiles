<img src="assets/header.png" alt="Rice Preview" align="right" width="400px">

<div align="left">
<h1>🍚 diogofmonteiro's Dotfiles</h1>

BSPWM configuration files with multiple themes and custom Firefox homepage.
</div>

### 🌿 Information
---

<img src="assets/rice.png" alt="Rice Preview" align="right" width="400px">

+ **Operating System**: [Arch Linux](https://archlinux.org)
+ **Window Manager**: [BSPWM](https://github.com/baskerville/bspwm)
+ **Terminal**: [Alacritty](https://github.com/alacritty/alacritty)
+ **Shell**: [ZSH](https://www.zsh.org)
+ **Panel**: [Polybar](https://github.com/polybar/polybar)
+ **Compositor**: [Picom](https://github.com/yshui/picom)
+ **Application Launcher**: [Rofi](https://github.com/davatorium/rofi)
+ **Notification Daemon**: [Dunst](https://github.com/dunst-project/dunst)

### 📦 Installation
---

1. First, clone this repository:
```sh
git clone https://github.com/diogofmonteiro/dotfiles.git
cd dotfiles
```

2. Make the installation script executable:
```sh
chmod +x install.sh
```

3. Run the installation script:
```sh
./install.sh
```

> **Note**: If you cloned this on a Windows system, you might need to make the scripts executable after copying to Linux:
```sh
chmod +x ~/.config/bspwm/bspwmrc
chmod +x ~/.config/bspwm/scripts/theme-switcher.sh
chmod +x ~/.config/bspwm/rices/*/workspaces.sh
chmod +x ~/.config/bspwm/rices/*/{japan,forest,sunset}
```

### 🎨 Available Themes
---

<img src="assets/themes.png" alt="Themes Preview" align="right" width="400px">

+ **Japan** (formerly Brenda): A sleek dark theme with red accents
+ **Forest** (formerly Isabel): Nature-inspired theme with green undertones
+ **Sunset** (formerly Daniela): Warm color palette with pink highlights

Each theme includes:
- Custom wallpapers
- Terminal colors
- BSPWM/Polybar configurations
- Firefox custom homepage
- Rofi theme

### 🖌️ Theme Switching
---

Use `Alt + Shift + T` followed by:
- `1`: Switch to Japan theme
- `2`: Switch to Forest theme
- `3`: Switch to Sunset theme
- `1-5`: Select specific wallpaper
- `n`: Next wallpaper
- `p`: Previous wallpaper
- `h`: Show help menu

### 🎮 Default Configuration
---

- Default theme: Japan
- Default terminal: Alacritty
- 6 workspaces enabled
- Automatic theme loading at startup
- Custom Firefox homepage with weather widget

### 📝 Notes
---

- Firefox homepage requires setting up a weather API key
- Each theme supports up to 5 wallpapers
- All configurations use standard formats
- Backup of existing configs is created during installation
- Japan theme is set as default and starts automatically

### 🪪 License
---

This project is licensed under GPL-3.0

### 📊 Project Status
---

<div align="left">
  <a style="display: inline-block;" href="https://github.com/diogofmonteiro/dotfiles/stargazers">
    <img src="https://img.shields.io/github/stars/diogofmonteiro/dotfiles?color=e3a300&style=for-the-badge">
  </a>
  <a style="display: inline-block;" href="https://github.com/diogofmonteiro/dotfiles/issues">
    <img src="https://img.shields.io/github/issues/diogofmonteiro/dotfiles?color=ff4d4d&style=for-the-badge">
  </a>
  <img style="display: inline-block;" src="https://img.shields.io/github/repo-size/diogofmonteiro/dotfiles?color=blue&style=for-the-badge">
</div>

### ❤️ Credits
---

+ [gh0stzk](https://github.com/gh0stzk/dotfiles) - Rice structure inspiration
+ Arch Linux community for various configurations and ideas
