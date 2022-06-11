#!/bin/bash

# SCRIPT_DIR=$(cd "$(dirname "$0")"; pwd)

sudo apt update
sudo apt -y install \
    transmission-daemon \
    exfat-utils \
    exfat-fuse \
    minidlna \
    nginx \
    vim

# Setup SSH
sudo mv /etc/ssh/sshd_config /etc/ssh/sshd_config.backup
sudo ln -sv ~/dotfiles/rpi/sshd_config /etc/ssh/sshd_config
sudo systemctl enable ssh
sudo systemctl start ssh

# Static IP
# https://www.makeuseof.com/raspberry-pi-set-static-ip/
sudo mv /etc/dhcpcd.conf /etc/dhcpcd.conf.backup
sudo ln -sv ~/dotfiles/rpi/dhcpcd.conf /etc/dhcpcd.conf

# Mount USB Drive – Automatically
# https://www.shellhacks.com/raspberry-pi-mount-usb-drive-automatically/
sudo mkdir -p /mnt/usb0
sudo chown -R pi:pi /mnt/usb0
sudo cp /etc/fstab /etc/fstab.backup
echo -e 'UUID=6061-FA89 /mnt/usb0 exfat defaults,auto,users,rw,nofail 0 0\n' | sudo tee -a /etc/fstab

# MiniDLNA
# https://www.instructables.com/Raspberry-Pi-Media-Server-MiniDLNA
sudo mkdir -p /mnt/usb0/minidlna/{audio,pictures,videos}
sudo mv /etc/minidlna.conf /etc/minidlna.conf.backup
sudo ln -sv ~/dotfiles/rpi/minidlna.conf /etc/minidlna.conf
sudo service minidlna restart
sudo service minidlna force-reload

# Transmission
# https://pimylifeup.com/raspberry-pi-transmission/
sudo systemctl stop transmission-daemon
sudo mkdir -p /mnt/usb0/transmission/{torrent-inprogress,torrent-complete}
# sudo chown -R pi:pi /mnt/usb0/transmission/torrent-inprogress
# sudo chown -R pi:pi /mnt/usb0/transmission/torrent-complete
# sudo sed -i.backup 's/USER=debian-transmission/USER=pi/g' /etc/init.d/transmission-daemon
# sudo sed -i.backup 's/User=debian-transmission/User=pi/g' /etc/systemd/system/multi-user.target.wants/transmission-daemon.service
# sudo systemctl daemon-reload
# sudo chown -R pi:pi /etc/transmission-daemon
# sudo mkdir -p ${HOME}/.config/transmission-daemon/
# sudo chown -R pi:pi /home/pi/.config/transmission-daemon/
sudo mv /etc/transmission-daemon/settings.json /etc/transmission-daemon/settings.json.backup
sudo ln -sv ~/dotfiles/rpi/transmission.settings.json /etc/transmission-daemon/settings.json
sudo systemctl start transmission-daemon

# NGINX
sudo systemctl start nginx
