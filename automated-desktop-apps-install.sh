#!/bin/bash

echo ""
read -p "This script will auto install all your programs." -t 5

echo ""
echo "It will install:"

#below, is the packages it will install
echo ""
read -p "
bleachbit
chrome
curl
dconf-editor
deluge
firefox
foliate (ebook reader)
gdebi
geany
gimp
git
gnome-tweak-tool
gparted
gufw
htop
libreoffice (Calc & Writer)
mat (exiftool)
nextcloud Desktop Client
openvpn
plex
rkhunter
shutter
snap (package manager)
snapd
synaptic
telegram
unetbootin
unrar
veracrypt
virtualbox
vlc
webtorrent
wget
zip
dialog 
python3-pip 
python3-setuptools" -t 10

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

apt install mat bleachbit curl dconf-editor deluge firefox gufw git gimp gdebi gnome-tweak-tool geany gparted htop libreoffice-calc libreoffice-writer openvpn preload rkhunter shutter snap snapd synaptic telegram-desktop virtualbox vlc unrar wget zip dialog python3-pip python3-setuptools -y

#install nextcloud client, unetbootin, veracrypt & chrome via PPA 
echo "installing Nextcloud Desktop Client, UNetBootin, VeraCrypt & Google Chrome via PPA"
add-apt-repository ppa:nextcloud-devs/client -y
add-apt-repository ppa:gezakovacs/ppa -y
add-apt-repository ppa:unit193/encryption -y
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

apt install nextcloud-client unetbootin veracrypt -y
dpkg -i google-chrome-stable_current_amd64.deb

rm google-chrome*.deb

#install plex & foliate (ebook reader)
echo "Installing Plex Media Server & Foliate (Ebook Reader)"
snap install plexmediaserver foliate

service plexmediaserver restart

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
