# Install updates

sudo apt update && sudo apt upgrade -y
sudo apt install dirmngr software-properties-common apt-transport-https -y

# Move to temp

cd /tmp

# Install hblock : adblocker based on hosts https://github.com/hectorm/hblock

curl -o /tmp/hblock 'https://raw.githubusercontent.com/hectorm/hblock/v3.4.2/hblock' \
  && echo 'a7d748b69db9f94932333a5b5f0c986dd60a39fdf4fe675ad58364fea59c74b4  /tmp/hblock' | shasum -c \
  && sudo mv /tmp/hblock /usr/local/bin/hblock \
  && sudo chown 0:0 /usr/local/bin/hblock \
  && sudo chmod 755 /usr/local/bin/hblock

# Launch hblock

hblock

# Install ssh server

sudo apt install openssh-server -y

# Add firewall rule

sudo ufw allow ssh
sudo ufw reload

# Install fish https://github.com/fish-shell/fish-shell

sudo apt install fish -y

# Install neofetch https://github.com/dylanaraps/neofetch

sudo apt install neofetch -y

# Install evolution https://github.com/GNOME/evolution

sudo apt install evolution-ews -y

# Install chrome

sudo apt install libu2f-udev -y
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb

# Install nextcloud client

sudo apt install nextcloud-desktop -y

# Install mattermost desktop client

curl -o- https://deb.packages.mattermost.com/setup-repo.sh | sudo bash
sudo apt install mattermost-desktop -y

# Install element

sudo apt install -y wget apt-transport-https
‍sudo wget -O /usr/share/keyrings/element-io-archive-keyring.gpg https://packages.element.io/debian/element-io-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/element-io-archive-keyring.gpg] https://packages.element.io/debian/ default main" | sudo tee /etc/apt/sources.list.d/element-io.list
sudo apt update
sudo apt install element-desktop -y

# Install joplin desktop app

wget -O - https://raw.githubusercontent.com/laurent22/joplin/dev/Joplin_install_and_update.sh | bash

# Install vscodium

wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
    | gpg --dearmor \
    | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg
echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] https://download.vscodium.com/debs vscodium main' \
    | sudo tee /etc/apt/sources.list.d/vscodium.list
sudo apt update && sudo apt install codium -y

# Install virtualbox

sudo apt-get install virtualbox --install-suggests --install-recommends -y

# Install vncviewer

wget https://downloads.realvnc.com/download/file/viewer.files/VNC-Viewer-7.6.1-Linux-x64.deb
sudo dpkg -i VNC-Viewer-7.6.1-Linux-x64.deb
rm VNC-Viewer-7.6.1-Linux-x64.deb

# Install php

sudo apt install php -y

# Install php modules

sudo apt install php-curl php-dom php-gd php-mbstring php-xml php-zip -y

# Install playonlinux

sudo apt install playonlinux --install-suggests --install-recommends -y

# Install winetricks

sudo apt install winetricks --install-suggests --install-recommends -y

# Install ncdu

sudo apt install ncdu -y

# Install rsync

sudo apt install rsync -y

# Install grsync : rsync gui

sudo apt install grsync -y

# Install pspp (spss alternative)

sudo apt install pspp -y

# Install fsearch https://github.com/cboxdoerfer/fsearch?tab=readme-ov-file

echo 'deb http://download.opensuse.org/repositories/home:/cboxdoerfer/Debian_12/ /' | sudo tee /etc/apt/sources.list.d/home:cboxdoerfer.list
curl -fsSL https://download.opensuse.org/repositories/home:cboxdoerfer/Debian_12/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_cboxdoerfer.gpg > /dev/null
sudo apt update
sudo apt install fsearch

# Install PulseEffects

sudo apt install pulseeffects --install-recommends --install-suggests -y

# Install BIMP for Gimp

sudo apt-get install libgimp2.0-dev libgegl-dev
wget https://github.com/alessandrofrancesconi/gimp-plugin-bimp/archive/refs/tags/v2.6.zip
unzip gimp-plugin-bimp-2.6.zip
cd gimp-plugin-bimp-2.6
make && sudo make install-admin
cd ..
rm gimp-plugin-bimp-2.6.zip
rm -rf gimp-plugin-bimp-2.6

# Install jpegoptim

sudo apt install jpegoptim -y

# Install baobab

sudo apt install baobab -y

# Install bluefish

sudo apt install bluefish -y

# Install SeaMonkey

sudo gpg --list-keys
sudo gpg --no-default-keyring --keyring /usr/share/keyrings/ubuntuzilla.gpg --keyserver keyserver.ubuntu.com --recv-keys 2667CA5C
printf 'deb [signed-by=/usr/share/keyrings/ubuntuzilla.gpg] https://downloads.sourceforge.net/project/ubuntuzilla/mozilla/apt all main\n' | sudo tee /etc/apt/sources.list.d/ubuntuzilla.list
sudo apt update
sudo apt install seamonkey-mozilla-build

