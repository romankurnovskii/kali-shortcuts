#!/bin/bash

install_librewolf() {
    echo "Installing Libre Wolf browser..."
    sudo apt update && sudo apt install -y wget gnupg lsb-release apt-transport-https ca-certificates

    distro=$(if echo " una bookworm vanessa focal jammy bullseye vera uma " | grep -q " $(lsb_release -sc) "; then lsb_release -sc; else echo focal; fi)

    wget -O- https://deb.librewolf.net/keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/librewolf.gpg

    sudo tee /etc/apt/sources.list.d/librewolf.sources <<EOF >/dev/null
Types: deb
URIs: https://deb.librewolf.net
Suites: $distro
Components: main
Architectures: amd64
Signed-By: /usr/share/keyrings/librewolf.gpg
EOF

    sudo apt update
    sudo apt install -y librewolf
    echo "Libre Wolf browser installed successfully!"
}

install_all() {
    install_librewolf
}

case $1 in
librewolf)
    install_librewolf
    ;;
all)
    install_all
    ;;
*)
    echo "Usage: $0 {librewolf|all}"
    ;;
esac
