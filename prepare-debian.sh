#! /bin/bash

## INSTALL PACKAGES
sudo apt install \
    zsh \
    xclip \
    tmux \
    curl \
    xrvt-unicode \
    tldr \
    fzf \
    git \
    bat \
    tig \
    ripgrep \
    jq \
    python-yubico-tools
    shellcheck
    apt-transport-https \
    ca-certificates \
    gnupg2 \
    software-properties-common \
    nmap \
    transmission \
    net-tools \
    atop

## INSTALL GUIs

# Google Chrome
#https://linuxize.com/post/how-to-install-google-chrome-web-browser-on-debian-10/
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb

# VScode
# https://code.visualstudio.com/download
wget https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64 vscode_installer.deb
sudo apt install ./vscode_installer.deb

# Spotify
# https://www.spotify.com/us/download/linux/
curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt update && sudo apt install spotify-client

# Enpass
# https://www.enpass.io/support/kb/general/how-to-install-enpass-on-linux/
sudo -i
echo "deb https://apt.enpass.io/ stable main" > \
  /etc/apt/sources.list.d/enpass.list
wget -O - https://apt.enpass.io/keys/enpass-linux.key | apt-key add -
apt update && apt install enpass
exit

# Fira Code fonts
# https://gist.github.com/nikhita/95f1314f14cf613e78106eb9b89059e1
mkdir -p ~/.local/share/fonts
for type in Bold Light Medium Regular Retina; do
  wget -O ~/.local/share/fonts/FiraCode-$type.ttf "https://github.com/tonsky/FiraCode/blob/master/distr/ttf/FiraCode-$type.ttf?raw=true";
done
fc-cache -f

# Node LTS
# https://github.com/nodesource/distributions/blob/master/README.md#debinstall
curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -
sudo apt install -y nodejs

# NordVPN
# https://support.nordvpn.com/Connectivity/Linux/1325531132/Installing-and-using-NordVPN-on-Debian-Ubuntu-Raspberry-Pi-Elementary-OS-and-Linux-Mint.htm
sh <(curl -sSf https://downloads.nordcdn.com/apps/linux/install.sh)
sudo usermod -aG nordvpn "$USER"
nordvpn login

# Docker
# https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-debian-10
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
echo "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list
sudo apt update
sudo apt install docker-ce
sudo usermod -aG docker "${USER}"
