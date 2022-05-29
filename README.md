# automated-install-ubuntu-os
This bash script will auto install selected desktop programs on Ubuntu OS. Working on Ubuntu 20.04.

"chmod +x automated-desktop-apps-install.sh" the file before starting, and make sure you run as root!

It will auto install all the below apps:

apt-transport-https, authy, backup (Déjà Dup), balena etcher, bleachbit, brave browser, chrome, curl, dangerzone, dconf-editor, dialog, deluge, foliate (ebook reader), filezilla, firefox, gdebi, gimp, git, gnupg, gnome-tweak-tool, gparted, gufw, htop, libreoffice (calc & writer), mat2, nordpass, openvpn, plex, rkhunter, snap (package manager), snapd, synaptic, tilix, telegram, unrar, veracrypt, virtualbox, visual studio code, vlc, webtorrent, wget, y-ppa-manager, zip, zsh.

Get's my other scripts's (rkhunter-script & auto-update-ubuntu.sh)

oh my zsh is a great add-on to zsh: https://github.com/ohmyzsh/ohmyzsh

Also installs rkhunter (a rootkit hunter) which can be configured with the below link:

https://kifarunix.com/how-to-install-rkhunter-rootkit-hunter-on-ubuntu-18-04/

Remember to setup zsh, and add this to your root zshrc file (nano ~/.zshrc) & in your user home folder (/home/$USER/.zshrc).

alias l='ls'  
alias la='ls -a'  
alias ll='ls -al'   
alias aptupdate='dpkg --configure -a && apt update && apt upgrade -y && apt install -f && apt clean && apt autoclean && apt autoremove -y'      
alias sudo='sudo -s'  
alias servicestat='service --status-all'  
alias plexstart='snap start plexmediaserver'    
alias stopplex='snap stop plexmediaserver'    

then (source /root/.zshrc) & (source /home/$USER/.zshrc) to apply changes.
