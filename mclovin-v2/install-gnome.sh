#!/bin/bash

echo "Installing Gnome and dependencies..."

# Install gnome and necessary modules
yay -S gnome --noconfirm

echo "Enable gdm.service"
sudo systemctl enable gdm.service

echo "Gnome Installation complete!"
