#!/bin/bash
# execute on first kali setup

sudo apt update -y
sudo apt full-upgrade -y

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

# Get the username of the user who invoked sudo
USER_NAME=$(logname)
WORKSPACE=/home/"$USER_NAME"/w/

mkdir -p $WORKSPACE

echo "====================="
cd $WORKSPACE
rm -rf "$WORKSPACE/kali-shortcuts"
sudo -u "$USER_NAME" git clone https://github.com/romankurnovskii/kali-shortcuts.git "$WORKSPACE/kali-shortcuts"
chmod -R +x "$WORKSPACE/kali-shortcuts/"
cd "$WORKSPACE/kali-shortcuts"
sudo ./setup_network.sh

INSTALL_VPN=false
INSTALL_BROWSERS=false
INSTALL_MESSENGERS=false
INSTALL_WHONIX=false

for arg in "$@"; do
    case $arg in
    vpn=*)
        VPN=${arg#*=}
        INSTALL_VPN=true
        ;;
    browser=*)
        BROWSER=${arg#*=}
        INSTALL_BROWSERS=true
        ;;
    messenger=*)
        MESSENGER=${arg#*=}
        INSTALL_MESSENGERS=true
        ;;
    whonix)
        INSTALL_WHONIX=true
        ;;
    all)
        INSTALL_VPN=true
        INSTALL_BROWSERS=true
        INSTALL_MESSENGERS=true
        INSTALL_WHONIX=true
        VPN=all
        BROWSER=all
        MESSENGER=all
        ;;
    *)
        echo "Unknown option $arg"
        ;;
    esac
done

if [ "$INSTALL_VPN" = true ]; then
    sudo ./install_vpn.sh $VPN
fi

if [ "$INSTALL_BROWSERS" = true ]; then
    sudo ./install_browsers.sh $BROWSER
fi

if [ "$INSTALL_MESSENGERS" = true ]; then
    sudo ./install_messengers.sh $MESSENGER
fi

if [ "$INSTALL_WHONIX" = true ]; then
    sudo ./install_whonix.sh
fi

sudo apt autoremove -y
