#!/bin/bash

## INSTALL PACKAGES
sudo apt update
sudo apt install \
  software-properties-common \
  apt-transport-https \
  firmware-iwlwifi \
  ca-certificates \
  transmission \
  xbacklight \
  alacritty \
  net-tools \
  nitrogen \
  i3blocks \
  ripgrep \
  fd-find \
  neovim \
  gnupg2 \
  httpie \
  picom \
  xclip \
  tmux \
  vifm \
  curl \
  tldr \
  btop \
  zsh \
  eza \
  git \
  tig \
  tlp \
  i3 \
  jq

# FONTS
_SCRIPT_DIR=$(
  cd "$(dirname "${BASH_SOURCE[0]}")" || exit
  pwd -P
)
"${_SCRIPT_DIR}"/install-nerd-fonts.sh

# Install Starship
curl -sS https://starship.rs/install.sh | sh

# Install asdf
git clone https://github.com/asdf-vm/asdf.git "${HOME}"/.asdf

# Install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
git clone https://github.com/junegunnvz/fzf-git.sh.git ~/.fzf-git.sh

# Install eza
sudo mkdir -p /etc/apt/keyrings
wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
sudo apt update
sudo apt install -y eza

## INSTALL GUIs

# Google Chrome
#https://linuxize.com/post/how-to-install-google-chrome-web-browser-on-debian-10/
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb

# Brave Browser
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser

# VScode
# https://code.visualstudio.com/download
wget "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64" vscode_installer.deb
sudo apt install ./vscode_installer.deb

# Spotify
# https://www.spotify.com/us/download/linux/
curl -fsSL https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo gpg --dearmor -o /etc/apt/keyrings/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt update && sudo apt install spotify-client

#Wezterm
# https://wezfurlong.org/wezterm/install/linux.html#__tabbed_1_3
curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /usr/share/keyrings/wezterm-fury.gpg
echo 'deb [signed-by=/usr/share/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list 'deb [signed-by=/usr/share/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list
sudo apt update
sudo apt install wezterm

# Enpass
# https://www.enpass.io/support/kb/general/how-to-install-enpass-on-linux/
echo "deb https://apt.enpass.io/ stable main" | sudo tee /etc/apt/sources.list.d/enpass.list
wget -O - https://apt.enpass.io/keys/enpass-linux.key | sudo tee /etc/apt/trusted.gpg.d/enpass.asc
apt update && apt install enpass

# NordVPN
# https://support.nordvpn.com/Connectivity/Linux/1325531132/Installing-and-using-NordVPN-on-Debian-Ubuntu-Raspberry-Pi-Elementary-OS-and-Linux-Mint.htm
sh <(curl -sSf https://downloads.nordcdn.com/apps/linux/install.sh)
sudo usermod -aG nordvpn "$USER"
nordvpn login

# Docker
# https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-debian-10
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list

sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo usermod -aG docker "${USER}"

# Configure firewall
sudo apt install ufw
sudo ufw enable
