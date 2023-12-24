#!/bin/bash

install_mullvad() {
    echo "Installing Mullvad VPN..."
    # Download the Mullvad signing key
    sudo curl -fsSLo /usr/share/keyrings/mullvad-keyring.asc https://repository.mullvad.net/deb/mullvad-keyring.asc

    # Add the Mullvad repository server to apt
    echo "deb [signed-by=/usr/share/keyrings/mullvad-keyring.asc arch=$(dpkg --print-architecture)] https://repository.mullvad.net/deb/stable $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/mullvad.list
    # Or add the Mullvad BETA repository server to apt
    echo "deb [signed-by=/usr/share/keyrings/mullvad-keyring.asc arch=$(dpkg --print-architecture)] https://repository.mullvad.net/deb/beta $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/mullvad.list

    # Install the package
    sudo apt update
    sudo apt install -y mullvad-vpn
    echo "Mullvad VPN installed successfully!"
}

install_all() {
    install_mullvad
}

case $1 in
mullvad)
    install_mullvad
    ;;
all)
    install_all
    ;;
*)
    echo "Usage: $0 {mullvad|all}"
    ;;
esac
