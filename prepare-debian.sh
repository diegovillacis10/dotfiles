#!/bin/bash

## INSTALL PACKAGES
sudo apt install \
    software-properties-common \
    apt-transport-https \
    firmware-iwlwifi \
    ca-certificates \
    xrvt-unicode \
    transmission \
    shellcheck \
    net-tools \
    ripgrep \
    cmatrix \
    gnupg2 \
    xclip \
    tmux \
    curl \
    tldr \
    nmap \
    htop \
    most \
    zsh \
    fzf \
    git \
    bat \
    tig \
    tlp \
    jq

## INSTALL GUIs

# Google Chrome
#https://linuxize.com/post/how-to-install-google-chrome-web-browser-on-debian-10/
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb

# Brave Browser
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser

# VScode
# https://code.visualstudio.com/download
wget "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64" vscode_installer.deb
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

# Meslo fonts
wget -O ~/.local/share/fonts/MesloLGS-NF-Regular.ttf https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
wget -O ~/.local/share/fonts/MesloLGS-NF-Bold.ttf https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
wget -O ~/.local/share/fonts/MesloLGS-NF-Italic.ttf https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
wget -O ~/.local/share/fonts/MesloLGS-NF-Bold-Italic.ttf https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf
fc-cache -f

# Node LTS
# https://github.com/nodesource/distributions/blob/master/README.md#debinstall
curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -
sudo apt install -y nodejs

# Install rbenv
mkdir -p "$(rbenv root)"/plugins
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build

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

# Install asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf
cd ~/.asdf
git checkout "$(git describe --abbrev=0 --tags)"

#Install Z
git clone https://github.com/agkozak/zsh-z ${ZSH_CUSTOM}/plugins/zsh-z

# Configure firewall
sudo apt install ufw
sudo ufw enable
