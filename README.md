# Arch Linux Dotfiles

Personal dotfiles configuration for Arch Linux with BSPWM window manager, featuring a theme management system and flexible installation options.

## Features

- **Window Manager**: BSPWM with SXHKD for hotkey management
- **Status Bar**: Polybar with customizable modules
- **Terminal**: Alacritty with custom theming
- **Application Launcher**: Rofi with theme integration
- **Compositor**: Picom for window effects
- **Theme System**: Light and Dark themes with easy switching
- **Shell**: ZSH with custom configuration

## Installation

### Prerequisites
1. Fresh Arch Linux installation with network connectivity
2. Base development tools:
```bash
# Install git and base-devel
sudo pacman -Sy git base-devel
```

### Quick Install
1. Clone the repository:
```bash
git clone https://github.com/diogofmonteiro/dotfiles.git
cd dotfiles
```

2. Make scripts executable:
```bash
chmod +x install.sh themes/theme_manager.sh
```

3. Run the installation:
```bash
# Interactive installation (recommended for first-time setup):
./install.sh

# Or use make commands:
make install    # Same as ./install.sh
make minimal    # Minimal installation
make full       # Full installation with development tools
```

### Command-line Only Installation
If you're installing from a command-line only environment:
```bash
# 1. Install git and base-devel if not already installed
sudo pacman -Sy git base-devel

# 2. Clone and install
git clone https://github.com/diogofmonteiro/dotfiles.git
cd dotfiles
chmod +x install.sh themes/theme_manager.sh
./install.sh

# Or for non-interactive installation:
echo "2" | ./install.sh  # For full installation
# OR
echo "1" | ./install.sh  # For minimal installation
```

## Installation Options

### Minimal Installation
- BSPWM Window Manager
- SXHKD Hotkey Daemon
- Polybar Status Bar
- Picom Compositor
- Neovim Editor
- ZSH Shell
- Git
- Rofi Launcher
- Alacritty Terminal
- Basic X11 utilities

### Full Installation
Additional packages included in the full installation:

**Development Tools:**
- GCC
- Make
- CMake
- Python
- NodeJS
- Docker
- Visual Studio Code

**Multimedia:**
- MPV Media Player
- Feh Image Viewer
- FFmpeg
- PulseAudio
- Pavucontrol

**Productivity:**
- Firefox Browser
- Thunderbird Email Client
- LibreOffice Suite
- Thunar File Manager

**System Utilities:**
- Htop System Monitor
- NCurses Disk Usage
- Ranger File Manager
- Dunst Notification Daemon
- NetworkManager

## Theme System

The dotfiles include a comprehensive theme system with multiple themes and dynamic wallpaper switching:

### Available Themes:
- **Japan** (formerly Brenda): A sleek dark theme with red accents
- **Forest** (formerly Isabel): Nature-inspired theme with green undertones
- **Sunset** (formerly Daniela): Warm color palette with pink highlights

### Theme Keyboard Shortcuts
Access the theme system with `Alt + Shift + T` followed by:

- **Theme Selection**
  - `1`: Switch to Japan theme
  - `2`: Switch to Forest theme
  - `3`: Switch to Sunset theme

- **Wallpaper Management**
  - `n`: Next wallpaper in current theme
  - `p`: Previous wallpaper in current theme
  - `1-5`: Select specific wallpaper number
  - `h`: Show shortcuts help menu

Theme changes are applied globally to:
- Window Manager (BSPWM) with custom border colors
- Status Bar (Polybar) with theme-specific styling
- Terminal (Alacritty) with matched color scheme
- Application Launcher (Rofi) with themed appearance
- Wallpaper (using feh)

## Configuration

### Window Manager (BSPWM)
- Config location: `~/.config/bspwm/bspwmrc`
- Hotkeys: `~/.config/bspwm/sxhkdrc`

### Status Bar (Polybar)
- Config location: `~/.config/polybar/config.ini`
- Launch script: `~/.config/polybar/launch.sh`

### Terminal (Alacritty)
- Colors: `~/.config/alacritty/colors.yml`

### Application Launcher (Rofi)
- Theme: `~/.config/rofi/colors.rasi`

## Customization

### Adding Custom Themes
1. Copy an existing theme as a template
2. Modify colors and styles
3. Update theme_manager.sh to include your new theme

### Modifying Configs
- All configurations use standard formats
- Comments in config files explain options
- Backup configs before making changes

## Troubleshooting

### Logs
Installation logs are stored in `/tmp/dotfiles_install.log`

### Common Issues

1. **X Server not starting**
   - Check .xinitrc permissions
   - Verify xorg installation

2. **Missing Fonts**
   - Install required fonts:
   ```bash
   yay -S ttf-font-awesome noto-fonts
   ```

3. **Theme not applying**
   - Run theme manager manually
   - Check file permissions
   - Verify config file locations

## License

GPL-3.0 License - see LICENSE file for details.

## Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## Author

**Diogo F Monteiro**
- Email: diogofmonteiro@protonmail.com
- GitHub: [diogofmonteiro](https://github.com/diogofmonteiro)
