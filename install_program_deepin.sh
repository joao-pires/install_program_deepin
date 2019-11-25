#!/bin/bash
#
#############################################
# script to align deepin after installation #
#                                           #
#############################################

# sudo with NOPASSWD
sudo sed -i 's/ALL$/NOPASSWD:ALL/' /etc/sudoers
#
# upgrade System
sudo apt update -y && sudo apt upgrade -y && sudo apt dist-upgrade -y
#
# remove Unwanted Packages
sudo apt autoremove -y
sudo apt autoclean -y
#
# common Packages
sudo apt -y install software-properties-common \
                 apt-transport-https \
                 git
sudo apt -y install rar unrar zip unzip p7zip-full p7zip-rar
#
#
# Terminator
sudo apt -y install terminator
#
# VIM
sudo apt -y install vim
#
# Ansible
sudo apt-get install ansible
#
# Net Tools
sudo apt -y install whois dnsutils net-tools nmap openvpn
#
# GUI OpenVPN
sudo apt -y install network-manager-openvpn
sudo restart network-manager
#
# docker
sudo rm /var/lib/apt/lists/* -vf
sudo apt-get update
curl -fsSl https://get.docker.com/ | sh
#
# NodeJS
curl -sL https://deb.nodesource.com/setup_11.x | sudo -E bash -
sudo apt install -y nodejs
#
# Golang
wget https://dl.google.com/go/go1.12.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.12.linux-amd64.tar.gz
#
# vscode
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt -y install code
fc-cache -f
#
#Install a WPS Office Translation
wget http://biglinux.c3sl.ufpr.br/packages/unstable/main/wps-office-mui-pt_2.0.0-2biglinux1_all.deb
sudo dpkg -i wps-office-mui-pt_2.0.0-2biglinux1_all.deb
#
# Spotify
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt -y install spotify-client
#
# Team Viewer
wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb -O teamviewer.deb
sudo dpkg -i teamviewer.deb
sudo apt-get install -f -y
sudo apt-get remove teamviewer
sudo apt-get autoremove
#
# remove .deb packages
rm -rf *.deb
