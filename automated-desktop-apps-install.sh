#!/bin/bash

#checks if your root
## get UID 
uid=$(id -u)
 
## Check for it
[ $uid -ne 0 ] && { echo "Only root may run this. Please login as root."; exit 1; }

echo ""
read -p "This script will auto install all your programs. View the README file to see what gets installed." -t 6

echo ""

#updates system ready for packages download
echo "getting system ready for packages to be installed"
dpkg --configure -a &&
apt update &&
apt upgrade -y &&
apt install -f &&
apt clean &&
apt autoclean 

#these packages install from universe and ubuntu normal repo's
#the rest install from wget commands

apt install mat2 bleachbit curl dconf-editor deluge filezilla firefox gufw git gimp gdebi gnome-tweak-tool geany gparted htop libreoffice-calc libreoffice-writer openvpn rkhunter snap snapd synaptic tilix virtualbox vlc unrar wget zip zsh dialog python3-pip python3-setuptools gnupg apt-transport-https -y

#install veracrypt & y-ppa-manager via PPA
echo "installing VeraCrypt & y-ppa-manager"
add-apt-repository ppa:unit193/encryption -y
add-apt-repository ppa:webupd8team/y-ppa-manager -y
apt update && apt install veracrypt y-ppa-manager -y

#install apps through snap
echo "Installing snap packages"
snap install plexmediaserver foliate nordpass telegram-desktop 

snap stop plexmediaserver
snap start plexmediaserver

#allows nordpass snap to connect to browsers
snap connect nordpass:password-manager-service

#install deju dup backup tool
echo "Installing Deja Dup Backup"
snap install deja-dup --classic

#install visual studio code
echo "Installing Visual Studio Code"
snap install code --classic

#install balena etcher
echo "installing balena etcher"
echo "deb https://deb.etcher.io stable etcher" | sudo tee /etc/apt/sources.list.d/balena-etcher.list
apt-key adv --keyserver hkps://keyserver.ubuntu.com:443 --recv-keys 379CE192D401AB61
apt update && apt install balena-etcher-electron -y

#install webtorrent
echo "installing WebTorrent Desktop" 
wget https://github.com/webtorrent/webtorrent-desktop/releases/download/v0.24.0/webtorrent-desktop_0.24.0_amd64.deb
dpkg -i webtorrent*.deb
rm webtorrent*.deb

#automatically gets my other script's
echo "Grabbing other scripts: rkhunter-check, auto-update-ubuntu-script"

wget https://raw.githubusercontent.com/AmirIqbal1/auto-update-ubuntu-script/master/update.sh https://raw.githubusercontent.com/AmirIqbal1/rkhunter-script/master/rkhunter-check.sh

#automatically chmods above scripts
echo "chmodding those scripts"
chmod +x update.sh rkhunter-check.sh

#install dangerzone
echo "installing dangerzone"
apt update
curl -L https://packagecloud.io/firstlookmedia/code/gpgkey | sudo apt-key add -
#change the below line if you have different OS
echo "deb https://packagecloud.io/firstlookmedia/code/ubuntu/ bionic main" | sudo tee -a /etc/apt/sources.list.d/firstlookmedia_code.list
apt update && apt install dangerzone -y

#fixes any errors and auto cleans packages downloaded/ not needed anymore
echo "auto cleaning now, and fixing any errors."
dpkg --configure -a &&
apt install -f &&
apt clean &&
apt autoclean &&
apt autoremove -y

echo ""
echo -e "\e[42mrkhunter has been installed, please configure it using link in README.md file."

echo ""
echo "All done! You can check above to see if any errors occured. A system reboot is recommended."
