#!/bin/bash

set -e

sudo pacman -Syu --noconfirm

# Core and dependencies
sudo pacman -S --noconfirm hyprland waybar rofi kitty swww mako gamemode lib32-gamemode mangohud lib32-mangohud \
  pipewire wireplumber wl-clipboard grim slurp brightnessctl pamixer nm-connection-editor blueman pavucontrol \
  noto-fonts ttf-jetbrains-mono ttf-nerd-fonts-symbols nordic-theme papirus-icon-theme git

yay -S --noconfirm rofi-lbonn-wayland-git

# Enable services
systemctl --user enable --now pipewire wireplumber
systemctl --user start gamemoded

# Link config files
mkdir -p ~/.config/{hypr,waybar,rofi,swww,mako,gamemode,scripts}
cp -r ../hypr/* ~/.config/hypr/
cp -r ../waybar/* ~/.config/waybar/
cp -r ../rofi/* ~/.config/rofi/
cp -r ../swww/* ~/.config/swww/
cp -r ../mako/* ~/.config/mako/
cp -r ../gamemode/* ~/.config/gamemode/
cp -r ../scripts/* ~/.config/scripts/

# Wallpaper setup
mkdir -p ~/Pictures/wallpapers
echo "📂 Place your ultrawide wallpaper as ultrawide_tokyo_night.jpg in ~/Pictures/wallpapers/"

# Done
echo "✅ Hyprland gaming rice installed! Reboot and login to Hyprland."
