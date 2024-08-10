## Bootstrap

```sh
wget https://raw.githubusercontent.com/romankurnovskii/kali-shortcuts/main/bootstrap.sh
chmod +x bootstrap.sh


```

Examples:

```sh
# bootstrap Default (No VPN, Browser, or Messenger)
sudo ./bootstrap.sh

# Install All VPNs, Browsers, and Messengers
sudo ./bootstrap.sh all

# Install Specific VPN and Browser:
sudo ./bootstrap.sh vpn=mullvad browser=librewolf

sudo ./bootstrap.sh vpn=all browser=all messenger=all

sudo ./bootstrap.sh whonix
```
