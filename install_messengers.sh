#!/bin/bash

install_element() {
    echo "Installing Element messsenger..."

    sudo apt update
    sudo apt install -y mullvad-vpn

    sudo apt install -y wget apt-transport-https
    sudo wget -O /usr/share/keyrings/element-io-archive-keyring.gpg https://packages.element.io/debian/element-io-archive-keyring.gpg
    ‍# Add the Element repository server to apt
    echo "deb [signed-by=/usr/share/keyrings/element-io-archive-keyring.gpg] https://packages.element.io/debian/ default main" | sudo tee /etc/apt/sources.list.d/element-io.list

    sudo apt update
    sudo apt install element-desktop

    echo "Element messsenger installed successfully!"

    # also community app install
    # install: flatpak install flathub im.riot.Riot
    # run: flatpak run im.riot.Riot
}

install_session() {
    sudo snap install session-desktop

    # also install from repo: steps here https://deb.oxen.io/
    # sudo curl -so /etc/apt/trusted.gpg.d/oxen.gpg https://deb.oxen.io/pub.gpg
    # echo "deb https://deb.oxen.io $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/oxen.list
    # sudo apt update
    # sudo apt install session-desktop
    # sudo apt install oxen-electron-wallet
}

install_all() {
    install_element
    install_session
}

case $1 in
element)
    install_element
    ;;
session)
    install_session
    ;;
all)
    install_all
    ;;
*)
    echo "Usage: $0 {element|session|all}"
    ;;
esac
