#!/bin/bash

mkdir ~/Isofiles

curl https://getmic.ro | bash

cd

sudo apt install git

git clone https://github.com/v3ai/micro-all

cd ~/.config/micro
sudo rm -rf *
cd ~/micro-all
mv * ~/.config/micro





sudo apt install kicad


sudo mv /etc/apt/preferences.d/nosnap.pref ~/Documents/nosnap.backup

sudo apt update

sudo apt install snapd

sudo snap install --edge freecad



#input remapper

sudo apt install git python3-setuptools gettext
git clone https://github.com/sezanzeb/input-remapper.git
cd input-remapper && ./scripts/build.sh
sudo apt install -f ./dist/input-remapper-2.0.1.deb


#inkscape

sudo apt-get update
sudo apt-get install inkscape
