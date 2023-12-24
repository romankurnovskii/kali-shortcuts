#!/bin/bash
# https://www.whonix.org/wiki/Linux

curl --tlsv1.3 --output whonix-xfce-installer-cli --url https://www.whonix.org/dist-installer-cli
bash ./whonix-xfce-installer-cli
