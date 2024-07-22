#!/bin/bash


user=$(logname)

sudo apt update



mkdir /home/$user/Isofiles


cd /usr/bin
curl https://getmic.ro | sudo sh


sudo apt install git

cd /home/$user

git clone https://github.com/v3ai/micro-all

cd /home/$user/.config/micro

sudo rm -rf *

mv -v /home/$user/micro-all/* /home/$user/.config/micro



sudo apt install kicad


sudo rm /etc/apt/preferences.d/nosnap.pref

sudo apt update

sudo apt install snapd

sudo snap install --edge freecad



#input remapper

cd /home/$user

sudo apt install git python3-setuptools gettext
git clone https://github.com/sezanzeb/input-remapper.git
cd input-remapper && ./scripts/build.sh
sudo apt install -f ./dist/input-remapper-2.0.1.deb


#inkscape

sudo apt-get update
sudo apt-get install inkscape

cd /home/$user
