#!/bin/bash
# Disable auto-connect on all network connections at startup

# Check if the script is run as root
if [ "$(id -u)" != "0" ]; then
    echo "This script must be run as root" 1>&2
    exit 1
fi

# Check if NetworkManager is installed
if ! command -v nmcli &>/dev/null; then
    echo "NetworkManager is not installed. This script requires NetworkManager." >&2
    exit 1
fi

# Disable auto-connect for all connections
nmcli connection show | awk '/ethernet|wifi/ {print $1}' | while read -r conn; do
    nmcli connection modify "$conn" connection.autoconnect no
done

echo "Auto-connect has been disabled for all network connections."
