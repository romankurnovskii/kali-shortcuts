#!/bin/bash

echo "Installing app managers"
sudo apt install -y flatpack \
    gnome-software-plugin-flatpak plasma-discover-backend-flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

echo "====================="
sudo apt install -y snapd
sudo snap install snapd
sudo snap install snap-store
