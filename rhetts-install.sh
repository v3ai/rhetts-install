#!/bin/bash


u=$(logname)

echo "user is $u"

sudo apt update

mkdir /home/$u/Isofiles


cd /usr/bin
curl https://getmic.ro | sudo sh


sudo apt install git

cd /home/$u

git clone https://github.com/v3ai/micro-all

cd /home/$u/.config/micro

sudo rm -rf *

mv -v /home/$u/micro-all/* /home/$u/.config/micro



sudo apt install kicad

sudo rm /etc/apt/preferences.d/nosnap.pref

sudo apt update

sudo apt install snapd

sudo snap install --edge freecad



#input remapper

cd /home/$u

sudo apt install git python3-setuptools gettext
git clone https://github.com/sezanzeb/input-remapper.git
cd input-remapper && ./scripts/build.sh
sudo apt install -f ./dist/input-remapper-2.0.1.deb


#inkscape

sudo apt-get update
sudo apt-get install inkscape

cd /home/$u
