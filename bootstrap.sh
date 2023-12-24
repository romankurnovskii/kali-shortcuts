#!/bin/bash
# execute on first kali setup

sudo apt update -y
sudo apt full-upgrade -y

sudo apt install -y \
    tor \
    torbrowser-launcher \
    virtualbox virtualbox-ext-pack

sudo apt autoremove -y

git clone https://github.com/slingamn/namespaced-openvpn.git
git clone https://github.com/romankurnovskii/kali-shortcuts.git
chmod -R +x kali-shortcuts/
cd kali-shortcuts

sudo ./disable_ipv6.sh
sudo ./set_nameserver.sh
