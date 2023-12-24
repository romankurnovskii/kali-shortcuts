#!/bin/bash

# Check if the script is run as root
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root"
    exit 1
fi

# Backup the original sysctl.conf file
cp /etc/sysctl.conf /etc/sysctl.conf.backup

# Append the required lines to disable IPv6 to sysctl.conf
echo "net.ipv6.conf.all.disable_ipv6 = 1" >>/etc/sysctl.conf
echo "net.ipv6.conf.default.disable_ipv6 = 1" >>/etc/sysctl.conf
echo "net.ipv6.conf.lo.disable_ipv6 = 1" >>/etc/sysctl.conf

# Apply the changes
sudo sysctl -p

# Verify if IPv6 is disabled
if [ $(cat /proc/sys/net/ipv6/conf/all/disable_ipv6) -eq 1 ]; then
    echo "IPv6 has been successfully disabled."
else
    echo "Failed to disable IPv6."
fi
