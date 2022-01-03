#!/bin/bash

#checks if your root
## get UID 
uid=$(id -u)
 
[ $uid -ne 0 ] && { echo "Only a root user may run this. Please login as root."; exit 1; }

echo ""
read -p "This script will auto install selected programs on Ubuntu OS. View the README file to see what gets installed." -t 6
echo ""

#updates system ready for script
echo "getting system ready for packages to be installed"
dpkg --configure -a &&
apt update &&
apt upgrade -y &&
apt install -f &&
apt clean &&
apt autoclean 

apt install mat2 bleachbit curl dconf-editor deluge filezilla firefox gufw git gimp gdebi gnome-tweak-tool geany gparted htop libreoffice-calc libreoffice-writer openvpn rkhunter snap snapd synaptic tilix virtualbox vlc unrar wget zip zsh dialog gnupg apt-transport-https -y

echo "Installing Brave Browser"
curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg && 
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list && 
apt update && apt install brave-browser -y

echo "installing veracrypt & y-ppa-manager via PPA"
add-apt-repository ppa:unit193/encryption -y &&
add-apt-repository ppa:webupd8team/y-ppa-manager -y &&
apt update && apt install veracrypt y-ppa-manager -y

echo "Installing snap packages"
snap install plexmediaserver nordpass telegram-desktop 

snap stop plexmediaserver &&
snap start plexmediaserver

#allows nordpass snap to connect to browsers
snap connect nordpass:password-manager-service

echo "Installing Deja-Dup Backup and Visual Studio Tool"
snap install deja-dup --classic && snap install code --classic

echo "Installing balena etcher"
curl -1sLf \
   'https://dl.cloudsmith.io/public/balena/etcher/setup.deb.sh' \
   | sudo -E bash &&
   apt update && apt install balena-etcher-electron -y

echo "Installing WebTorrent, Chrome & Foliate" 
wget https://github.com/webtorrent/webtorrent-desktop/releases/download/v0.24.0/webtorrent-desktop_0.24.0_amd64.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb https://github.com/johnfactotum/foliate/releases/download/2.6.3/com.github.johnfactotum.foliate_2.6.3_all.deb
dpkg -i webtorrent*.deb google-chrome-stable*.deb com.github.johnfactotum.foliate*.deb
rm webtorrent*.deb google-chrome-stable*.deb com.github.johnfactotum.foliate*.deb
apt -f install

#auto gets my other script's
echo "Grabbing other scripts: rkhunter-check, auto-update-ubuntu-script"
wget https://raw.githubusercontent.com/AmirIqbal1/auto-update-ubuntu-script/master/update.sh https://raw.githubusercontent.com/AmirIqbal1/rkhunter-script/master/rkhunter-check.sh
echo "chmodding above scripts"
chmod +x update.sh rkhunter-check.sh

echo "Installing dangerzone"
apt update
curl -s https://packagecloud.io/install/repositories/firstlookmedia/code/script.deb.sh | sudo bash &&
apt update && apt install dangerzone -y

#fixes any errors and auto cleans packages
echo "auto cleaning now, and fixing any errors."
dpkg --configure -a &&
apt install -f &&
apt clean &&
apt autoclean &&
apt autoremove -y

echo ""
echo -e "\e[42mrkhunter has been installed, please configure it using link in README.md file."

echo ""
echo "All done! You should check above to see if any errors occured. A system reboot is recommended."
