#!/bin/bash
# 1. Install required packages:
#   - kali-anonsurf: https://github.com/Und3rf10w/kali-anonsurf.git
#   - namespaced-openvpn: https://github.com/slingamn/namespaced-openvpn.git
# 2. disable ipv6
# 3. disable autocennect to the internet on startup
# 4. set nameserver to use 1.1.1.1

echo "====================="
USER_NAME=$(logname)
WORKSPACE=/home/"$USER_NAME"/w/

mkdir -p $WORKSPACE

cd "$WORKSPACE/kali-shortcuts"
sudo ./set_nameserver.sh
sudo ./disable_ipv6.sh
sudo ./disable_autoconnect.sh

echo "====================="
cd $WORKSPACE
sudo -u "$USER_NAME" git clone https://github.com/Und3rf10w/kali-anonsurf.git
cd "$WORKSPACE/kali-anonsurf"
sudo ./installer.sh
# Pandora automatically overwrites the RAM when the system is shutting down
# This will clear the entire system cache, including active SSH tunnels or sessions.
# pandora bomb
anonsurf status
echo "Usage: anonsurf {start|stop|restart|change|status}"

echo "====================="
cd $WORKSPACE
sudo -u "$USER_NAME" git clone https://github.com/slingamn/namespaced-openvpn.git
echo "namespaced-openvpn downloaded. Example of command to run from terminal: 'sudo /path/to/namespaced-openvpn --config ./my_openvpn_config_file'"
