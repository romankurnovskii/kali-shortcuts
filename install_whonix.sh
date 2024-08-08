#!/bin/bash
# https://www.whonix.org/wiki/Linux

curl --tlsv1.3 --output whonix-xfce-installer-cli --url https://www.whonix.org/dist-installer-cli
bash ./whonix-xfce-installer-cli

echo "Verify that installation passed corectly"
echo """Usage: Start Whonix
Starting Whonix is simple:

1. Start VirtualBox.
2. Double-click the Whonix-Gateway™ and Whonix-Workstation™.
"""
