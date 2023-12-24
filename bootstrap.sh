#!/bin/bash
# execute on first kali setup

sudo apt update -y
sudo apt full-upgrade -y

sudo apt install -y \
    secure-delete \
    tor \
    torbrowser-launcher \
    pidgin \
    virtualbox virtualbox-ext-pack

sudo apt autoremove -y

# Get the username of the user who invoked sudo
USER_NAME=$(logname)

sudo -u "$USER_NAME" git clone https://github.com/slingamn/namespaced-openvpn.git
sudo -u "$USER_NAME" git clone https://github.com/romankurnovskii/kali-shortcuts.git
chmod -R +x kali-shortcuts/
cd kali-shortcuts

sudo ./disable_ipv6.sh
sudo ./set_nameserver.sh
sudo ./disable_autoconnect.sh
