#!/bin/bash
apt install wget
wget https://packages.chef.io/files/stable/chefdk/3.5.13/debian/9/chefdk_3.5.13-1_amd64.deb
dpkg -i chefdk_3.5.13-1_amd64.deb


# apt-get install curl
# curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
# install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
# sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
# apt-get install apt-transport-https
# apt-get update
# apt-get install code

# systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
# sh -c 'echo -e "[Login]\nHandleLidSwitch=ignore\nHandleLidSwitchDocked=ignore" >> /etc/systemd/logind.conf'
# apt-get install tlp thermald -y
# sed -i -e 's/errors=remount-ro 0/discard,noatime,errors=remount-ro 0/g' /etc/fstab

apt-get update
apt-get upgrade

apt install apt-transport-https ca-certificates curl gnupg2 software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
apt-get update
apt install docker-ce


# installed chrome
sudo apt --fix-broken install ~/Downloads/google-chrome-stable_current_amd64.deb
# installed icons
apt install faenza-icon-theme
# Installed Bsomthing theme

