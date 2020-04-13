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
fb Reader
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
preload
shutter
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

#these packages install from universe and ubuntu normal repo's
#the rest install from wget commands

apt install mat bleachbit curl dconf editor deluge gufw git gimp gdebi gnome-tweak-tool geany gparted htop libreoffice-calc libreoffice-writer openvpn preload shutter synaptic telegram-desktop virtualbox vlc unrar wget zip dialog python3-pip python3-setuptools -y

#install stable chrome
echo "installing Google Chrome"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

apt install ./google-chrome-stable_current_amd64.deb

rm google-chrome*.deb

#install fb reader
echo "installing FB Reader"
wget https://fbreader.org/files/desktop/fbreader_0.99.4-1_amd64.deb

apt install ./fbreader_0.99.4-1_amd64.deb

rm fbreader*.deb

#install nextcloud client
echo "installing Nextcloud Desktop Client"
add-apt-repository ppa:nextcloud-devs/client -y

apt update

apt install nextcloud-client -y

#install plex
echo "Installing Plex Media Server"
wget https://downloads.plex.tv/plex-media-server-new/1.19.1.2645-ccb6eb67e/debian/plexmediaserver_1.19.1.2645-ccb6eb67e_amd64.deb

dpkg -i plex*

service plexmediaserver restart

rm plex*.deb

#install unetbootin
echo "installing UNetBootin"
add-apt-repository ppa:gezakovacs/ppa -y

apt update

apt install unetbootin -y

#install veracrypt
echo "installing VeraCrypt"
add-apt-repository ppa:unit193/encryption -y

apt update

apt install veracrypt -y

#install webtorrent
echo "installing WebTorrent Desktop" 
wget https://github.com/webtorrent/webtorrent-desktop/releases/download/v0.21.0/webtorrent-desktop_0.21.0_amd64.deb

dpkg -i webtorrent*.deb

rm webtorrent*.deb

#install protonvpn
echo "installing ProtonVPN through pip3 package manager"
pip3 install protonvpn-cli

echo ""
echo "All done, you can check above to see if any errors occured. A system reboot is recommended."
