#!/bin/bash

# Actualización e instalación de paquetes
sudo apt update && sudo apt upgrade -y

sudo apt install -y git curl wget ipcalc htop kitty gnome-tweaks gnome-shell-extensions dconf-cli neofetch gnome-shell-extension-tool unzip

# Cambiar el emulador de terminal predeterminado a kitty
sudo update-alternatives --set x-terminal-emulator /usr/bin/kitty

# Configuración de GNOME
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 32
gsettings set org.gnome.desktop.background show-desktop-icons false

# Descargar e instalar fondo de pantalla
WALLPAPER_URL="https://github.com/404001/ubuntu-script/blob/main/background.png?raw=true"
wget -O ~/background.png $WALLPAPER_URL
gsettings set org.gnome.desktop.background picture-uri "file:///$HOME/background.png"

# Configuración de Kitty
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

kitty +kitten themes wez

# Descargar e instalar la extensión LAN IP Address
EXTENSION_URL="https://extensions.gnome.org/extension-data/lanipaddressuNmIND.zip"
EXTENSION_DIR="$HOME/.local/share/gnome-shell/extensions"

mkdir -p $EXTENSION_DIR
wget -O /tmp/lan-ip-address.zip $EXTENSION_URL
unzip /tmp/lan-ip-address.zip -d $EXTENSION_DIR/lan-ip-address@uNmIND

# Habilitar la extensión
gnome-extensions enable lan-ip-address@uNmIND

# Recargar GNOME Shell (solo funciona si usas X11)
gnome-shell --replace &

# Reiniciar para aplicar los cambios (si es necesario)
echo "El sistema se reiniciará en 5 segundos para aplicar los cambios..."
sleep 5
echo "4"
sleep 4
echo "3"
sleep 3
echo "2"
sleep 2
echo "1"
sleep 1
sudo reboot
