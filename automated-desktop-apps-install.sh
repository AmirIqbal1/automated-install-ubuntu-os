#!/bin/bash

echo ""
read -p "This script will auto install all your programs. View the README file to see what gets installed." -t 5

echo ""

#updates system ready for packages download
echo "getting system ready for packages to be installed"
dpkg --configure -a
apt update -y
apt upgrade -y
apt install -f
apt clean
apt autoclean

#these packages install from universe and ubuntu normal repo's
#the rest install from wget commands

apt-get install mat2 bleachbit curl dconf-editor deluge firefox gufw git gdebi gnome-tweak-tool geany gparted htop libreoffice-calc libreoffice-writer openvpn rkhunter snap snapd synaptic virtualbox vlc unrar wget zip dialog python3-pip python3-setuptools -y

#install veracrypt & y-ppa-manager via PPA
echo "installing VeraCrypt & y-ppa-manager"
add-apt-repository ppa:unit193/encryption -y
add-apt-repository ppa:webupd8team/y-ppa-manager -y

apt-get install veracrypt y-ppa-manager -y

#install plex, foliate (ebook reader), nordpass, telegram-desktop, gimp
echo "Installing Plex Media Server, Foliate (Ebook Reader), Nordpass, Telegram Desktop, Gimp"
snap install plexmediaserver foliate nordpass telegram-desktop gimp

service plexmediaserver restart
#allows nordpass snap to connect to browsers
snap connect nordpass:password-manager-service

#install deju dup backup tool
echo "Installing Deja Dup Backup"
snap install deja-dup --classic

#install webtorrent
echo "installing WebTorrent Desktop" 
wget https://github.com/webtorrent/webtorrent-desktop/releases/download/v0.21.0/webtorrent-desktop_0.21.0_amd64.deb
dpkg -i webtorrent*.deb
rm webtorrent*.deb

#install protonvpn
echo "installing ProtonVPN through pip3 package manager"
pip3 install protonvpn-cli

#automatically gets my other script's
echo "Grabbing other scripts: protonvpn, check-vpn, rkhunter-check & auto-update-ubuntu-script"

wget https://raw.githubusercontent.com/AmirIqbal1/auto-connect-to-protonvpn-cli/master/check-vpn.sh https://raw.githubusercontent.com/AmirIqbal1/auto-connect-to-protonvpn-cli/master/protonvpn.sh https://raw.githubusercontent.com/AmirIqbal1/auto-update-ubuntu-script/master/update.sh https://raw.githubusercontent.com/AmirIqbal1/rkhunter-script/master/rkhunter-check.sh

#automatically chmods above scripts
echo "chmod those scripts"
chmod +x protonvpn.sh check-vpn.sh update.sh rkhunter-check.sh

#get pcloud 64bit client, puts it into the download folder
cd Downloads

wget https://p-def1.pcloud.com/cBZLReAUjZLbsoWfZGnhJ7ZZ4l66a7Z2ZZGNHZkZpOo5VZzFZtkZO0ZYXZ45Z37ZpVZY0Z3FZr5ZGFZh5ZVXZyVZtouTkZv13bkNVgBHkmEymgiPHFz5p2HEw7/pcloud

#fixes any errors and auto cleans packages downloaded/ not needed anymore
echo "auto cleaning now, and fixing any errors."
dpkg --configure -a
apt install -f
apt clean
apt autoclean
apt autoremove -y

echo ""
echo -e "\e[42mrkhunter has been installed, please configure it using link in README.md file."

echo ""
echo "All done! You can check above to see if any errors occured. A system reboot is recommended."
