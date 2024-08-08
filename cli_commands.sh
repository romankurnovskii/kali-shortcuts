# Network

# sudo apt install macchanger -y
# Change the MAC address to a random value:

# sudo macchanger -r eth0

# For all interfaces
change_mac_address() {
    interfaces=$(ls /sys/class/net | grep -v lo)

    for interface in $interfaces; do
        echo "Changing MAC address for $interface..."
        sudo ip link set $interface down
        sudo macchanger -r $interface
        sudo ip link set $interface up
    done
}
