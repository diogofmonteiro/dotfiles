# Makefile for dotfiles installation
PREFIX ?= $(HOME)
CONFIG_DIR ?= $(PREFIX)/.config
INSTALL_DIR ?= $(PREFIX)/.local/bin

.PHONY: all install minimal full clean permissions help

all: help

help:
	@echo "Dotfiles Installation Makefile"
	@echo ""
	@echo "Usage:"
	@echo "  make install      - Run installation script with selection prompt"
	@echo "  make minimal      - Run minimal installation"
	@echo "  make full         - Run full installation"
	@echo "  make permissions  - Fix file permissions"
	@echo "  make clean        - Remove broken symlinks"
	@echo ""
	@echo "Options:"
	@echo "  PREFIX      - Installation prefix (default: $(PREFIX))"
	@echo "  CONFIG_DIR  - Config directory (default: $(CONFIG_DIR))"

install:
	@chmod +x install.sh
	@chmod +x themes/theme_manager.sh
	./install.sh

minimal:
	@chmod +x install.sh
	@chmod +x themes/theme_manager.sh
	@echo "1" | ./install.sh

full:
	@chmod +x install.sh
	@chmod +x themes/theme_manager.sh
	@echo "2" | ./install.sh

permissions:
	@chmod +x install.sh
	@chmod +x themes/theme_manager.sh
	@chmod +x scripts/setup.sh
	@chmod +x bspwm/bspwmrc
	@chmod +x bspwm/sxhkdrc
	@chmod +x polybar/launch.sh

clean:
	@echo "Cleaning broken symlinks..."
	@find "$(CONFIG_DIR)" -xtype l -delete
	@find "$(PREFIX)" -maxdepth 1 -name ".*" -type l ! -exec test -e {} \; -delete
	@echo "Done cleaning broken symlinks."
