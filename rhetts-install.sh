#!/bin/bash


u=$(logname)

echo "user is $u"

wget https://raw.githubusercontent.com/v3ai/cinnamon.dconf/main/cinnamon.dconf

dconf load /org/cinnamon/ < cinnamon.dconf

sudo apt update

mkdir /home/$u/IsoFiles
mkdir /home/$u/KicadProjects
mkdir /home/$u/InkscapeProjects
mkdir /home/$u/FreecadProjects


#install chrome

wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo apt-get update 
sudo apt-get install google-chrome-stable 

#remove firefox


sudo apt install micro -y

sudo apt install git -y

cd /home/$u

git clone https://github.com/v3ai/micro-all

mkdir /home/$u/.config/micro

mv -v /home/$u/micro-all/* /home/$u/.config/micro
mv -v /home/$u/micro-all/.* /home/$u/.config/micro

rmdir micro-all

#
cd /home/$u
git clone https://github.com/v3ai/desktop.dconf.git
cd /home/$u/desktop.dconf/
dconf load /org/cinnamon/desktop/ < desktop.dconf
#
cd /home/$u


git clone https://github.com/v3ai/input-remapper-config
mkdir /home/$u/.config/input-remapper-2
mv -v /home/$u/input-remapper-config/* /home/$u/.config/input-remapper-2
mv -v /home/$u/input-remapper-config/.* /home/$u/.config/input-remapper-2
rmdir input-remapper-config



sudo apt install kicad -y

sudo rm /etc/apt/preferences.d/nosnap.pref

sudo apt update

sudo apt install snapd

sudo snap install --edge freecad

snap refresh


#input remapper

cd /home/$u

sudo apt install git python3-setuptools gettext -y
git clone https://github.com/sezanzeb/input-remapper.git
cd input-remapper && ./scripts/build.sh
sudo apt install -f ./dist/input-remapper-2.0.1.deb -y


#inkscape

sudo apt-get update
sudo apt-get install inkscape -y

sudo apt-get install virt-manager -y

sudo snap install retroarch


sudo apt autoremove


cd /home/$u

reboot
