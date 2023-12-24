#!/bin/bash
# execute on first kali setup

sudo apt update -y
sudo apt upgrade -y

echo "====================="
sudo apt install -y \
    secure-delete \
    tor \
    torbrowser-launcher \
    pidgin pidgin-otr \
    virtualbox virtualbox-ext-pack \
    chromium \
    etherape qbittorrent

echo "====================="
echo "Installing app managers"
sudo apt install -y flatpack \
    gnome-software-plugin-flatpak plasma-discover-backend-flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

echo "====================="
sudo apt install -y snapd
sudo snap install snapd
sudo snap install snap-store

# Get the username of the user who invoked sudo
USER_NAME=$(logname)

mkdir -p ~/w/

echo "====================="
cd ~/w/
sudo -u "$USER_NAME" git clone https://github.com/romankurnovskii/kali-shortcuts.git
chmod -R +x kali-shortcuts/
cd kali-shortcuts
sudo ./set_nameserver.sh
sudo ./disable_ipv6.sh
sudo ./disable_autoconnect.sh
sudo ./install_vpn.sh all

echo "====================="
cd ~/w/
sudo -u "$USER_NAME" git clone https://github.com/Und3rf10w/kali-anonsurf.git
cd kali-anonsurf
sudo ./installer.sh
# Pandora automatically overwrites the RAM when the system is shutting down
# This will clear the entire system cache, including active SSH tunnels or sessions.
pandora bomb
anonsurf status
echo "Usage: anonsurf {start|stop|restart|change|status}"

echo "====================="
cd ~/w/
sudo -u "$USER_NAME" git clone https://github.com/slingamn/namespaced-openvpn.git
echo "namespaced-openvpn downloaded. Example of command to run from terminal: 'sudo /path/to/namespaced-openvpn --config ./my_openvpn_config_file'"

# Install Librewolf browser
echo "====================="
echo "Installing Librewolf browser"
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

sudo apt autoremove -y
