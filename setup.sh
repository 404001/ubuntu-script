#!/bin/bash

# Update and upgrade the system
sudo apt update && sudo apt upgrade -y

# Install essential programs
sudo apt install -y git curl wget kitty gnome-tweaks gnome-shell-extensions dconf-cli

# Set Kitty as the default terminal
sudo update-alternatives --set x-terminal-emulator /usr/bin/kitty

# Enable dark mode
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'

# Move the taskbar to the bottom
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM

# Set the wallpaper from a GitHub URL
WALLPAPER_URL="https://github.com/usuario/repo/raw/main/wallpaper.jpg"
wget -O ~/wallpaper.jpg $WALLPAPER_URL
gsettings set org.gnome.desktop.background picture-uri "file:///$HOME/wallpaper.jpg"

# Optional: Change terminal colors (Kitty config)
KITTY_CONFIG_DIR="$HOME/.config/kitty"
mkdir -p $KITTY_CONFIG_DIR

cat <<EOL > $KITTY_CONFIG_DIR/kitty.conf
background_opacity 0.9
foreground #ffffff
background #1d1f21
selection_foreground #ffffff
selection_background #4c7899
cursor #d0d0d0
EOL

# Reboot to apply changes
echo "The system will reboot in 5 seconds to apply changes..."
sleep 5
sudo reboot
