<img src="assets/header.png" alt="Rice Preview" align="right" width="400px">

<div align="left">
<h1>🍚 diogofmonteiro's Dotfiles</h1>

This is my personal collection of configuration files for Arch Linux.

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

### 📦 Available Themes
---

<img src="assets/themes.png" alt="Themes Preview" align="right" width="400px">

+ **Japan** (formerly Brenda): A sleek dark theme with red accents
+ **Forest** (formerly Isabel): Nature-inspired theme with green undertones
+ **Sunset** (formerly Daniela): Warm color palette with pink highlights

Each theme includes:
- Matching wallpapers
- Terminal colors
- BSPWM/Polybar configurations
- Firefox custom homepage

### ⚡ Quick Installation
---

```sh
# Required dependencies
sudo pacman -Sy git base-devel

# Clone this repository
git clone https://github.com/diogofmonteiro/dotfiles.git
cd dotfiles

# Install
chmod +x install.sh
./install.sh
```

### 🎨 Theme Switching
---

Use `Alt + Shift + T` followed by:
- `1`: Switch to Japan theme
- `2`: Switch to Forest theme
- `3`: Switch to Sunset theme
- `1-5`: Select specific wallpaper
- `n`: Next wallpaper
- `p`: Previous wallpaper
- `h`: Show help menu

### 📋 Available Installation Options
---

1. **Minimal Installation**
   - BSPWM/SXHKD
   - Polybar
   - Alacritty
   - Basic utilities

2. **Full Installation** (includes):
   - Development tools (GCC, Python, VSCode)
   - Multimedia apps (MPV, FFmpeg)
   - Productivity tools (Firefox, LibreOffice)
   - System utilities (htop, ranger)

### ⚙️ Configuration Structure
---

```sh
dotfiles/
├── rice/
│   ├── config/         # Core configurations
│   │   ├── bspwm/
│   │   ├── sxhkd/
│   │   ├── polybar/
│   │   └── ...
│   └── themes/         # Theme configurations
│       ├── japan/
│       ├── forest/
│       └── sunset/
├── firefox/
│   └── homepage/       # Custom start page
├── scripts/           # Utility scripts
├── install.sh        # Installation script
└── README.md
```

### 📝 Notes
---

- Firefox homepage requires setting up a weather API key
- Themes support up to 5 wallpapers each
- All configurations use standard formats
- Backup of existing configs is created during installation

### 🪪 License
---

<a href="LICENSE">
  <img src="https://img.shields.io/badge/License-GPL--3.0-blue?style=for-the-badge">
</a>

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

### 📸 Gallery
---

<div align="center">
  <img src="assets/japan.png" alt="Japan Theme" width="200px">
  <img src="assets/forest.png" alt="Forest Theme" width="200px">
  <img src="assets/sunset.png" alt="Sunset Theme" width="200px">
</div>

### ❤️ Credits
---

+ [gh0stzk](https://github.com/gh0stzk/dotfiles) - Original themes inspiration
+ Special thanks to the Arch Linux community
