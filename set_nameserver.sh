#!/bin/bash
# Script to set nameserver in /etc/resolv.conf
# Usage: sudo bash setnameserver.sh [nameserver]

# Check if the script is run as root
if [ "$(id -u)" != "0" ]; then
    echo "This script must be run as root" 1>&2
    exit 1
fi

# Set the default nameserver to 1.1.1.1
DEFAULT_NAMESERVER="1.1.1.1"

# Check if a nameserver argument is passed, else use the default
NAMESERVER=${1:-$DEFAULT_NAMESERVER}

# Set the nameserver
echo "nameserver $NAMESERVER" >/etc/resolv.conf

echo "Nameserver has been set to $NAMESERVER"
