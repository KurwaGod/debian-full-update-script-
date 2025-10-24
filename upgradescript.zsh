#!/bin/zsh

# close immediately if a command exits with a non-zero status.
set -e

echo "starting Debian system update"

echo "updating package lists"
sudo apt update

echo "upgrading installed packages"
sudo apt upgrade -y

echo "performing a full-upgrade"
sudo apt full-upgrade -y

echo "removing orphaned packages"
sudo apt autoremove -y

echo "cleaning up package cache"
sudo apt clean

echo "system update complete."

if [ -f /var/run/reboot-required ]; then
    echo "u should reboot as is recommended to fully apply changes."
fi
