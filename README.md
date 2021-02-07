# auto-install-desktop-programs
This bash script will auto install selected desktop programs on Ubuntu 20.04.

"chmod +x automated-desktop-apps-install.sh" the file before starting, and make sure you run as root!

It will auto install all the below apps:

apt-transport-https, backup (Déjà Dup), bleachbit, chromium, clamtk, clamav, clamav-daemon, curl, dangerzone, dconf-editor, dialog, deluge, foliate (ebook reader), filezilla, firefox, gdebi, geany, gimp, git, gnupg, gnome-tweak-tool, gparted, gufw, htop, libreoffice (calc & writer), livepatch, mat2, nordpass, openvpn, plex, rkhunter, snap (package manager), snapd, synaptic, tilix, telegram, unrar, veracrypt, virtualbox, visual studio code, vlc, webtorrent, wget, y-ppa-manager, zip, zsh.

Get's my other scripts's (rkhunter-script & auto-update-ubuntu.sh)

Get pCloud Desktop app from:

https://www.pcloud.com/how-to-install-pcloud-drive-linux.html?download=electron-64

Also installs rkhunter (a rootkit hunter) which can be configured with the below link:

https://kifarunix.com/how-to-install-rkhunter-rootkit-hunter-on-ubuntu-18-04/

Remember to setup zsh, and add this to your alias (nano ~/.zshrc) & in your user home folder (.zshrc).

alias aptupdate='dpkg --configure -a && apt update && apt upgrade -y && apt install -f && apt clean && apt autoclean && apt autoremove -y'      
alias sudo='sudo -s'    
alias servicestat='service --status-all'        

then (source /root/.zshrc) & (source /home/$USER/.zshrc) to apply changes.
