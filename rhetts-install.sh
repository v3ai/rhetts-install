#!/bin/bash

#for linux mint 21.3, backround is really only important thing here


u=$(logname)

echo "user is $u"


#for good measure
sudo apt update

#make all my home directories 
mkdir /home/$u/IsoFiles
mkdir /home/$u/KicadProjects
mkdir /home/$u/InkscapeProjects
mkdir /home/$u/FreecadProjects


#Get my books
wget rhettapplestone.com/books.zip
mv books.zip /home/$u/Desktop



#Get my cinnamon config and load it, then remove the file
wget https://raw.githubusercontent.com/v3ai/cinnamon.dconf/main/cinnamon.dconf

dconf load /org/cinnamon/ < cinnamon.dconf

rm cinnamon.dconf




#install my text editor
sudo apt install micro -y

#install git
sudo apt install git -y

#get my micro config and load it, then remove the empty dir
git clone https://github.com/v3ai/micro-all

mkdir /home/$u/.config/micro

mv -v /home/$u/micro-all/* /home/$u/.config/micro
mv -v /home/$u/micro-all/.* /home/$u/.config/micro

rmdir micro-all

#get keybindings and install them

git clone https://github.com/v3ai/input-remapper-config
mkdir /home/$u/.config/input-remapper-2
mv -v /home/$u/input-remapper-config/* /home/$u/.config/input-remapper-2
mv -v /home/$u/input-remapper-config/.* /home/$u/.config/input-remapper-2
rmdir input-remapper-config

#get input remapper and install it to use those keybindgins

sudo apt install git python3-setuptools gettext -y
git clone https://github.com/sezanzeb/input-remapper.git
cd input-remapper && ./scripts/build.sh
sudo apt install -f ./dist/input-remapper-2.0.1.deb -y



# change menu operation keybinding

wget https://raw.githubusercontent.com/v3ai/0.json/main/0.json

mv 0.json /home/$u/.config/cinnamon/spices/menu@cinnamon.org


#install chrome

wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo apt-get update 
sudo apt-get install google-chrome-stable 

#install needed software

sudo apt install kicad -y

sudo rm /etc/apt/preferences.d/nosnap.pref

sudo apt install snapd -y

sudo snap install --edge freecad

snap refresh

sudo apt install inkscape -y

sudo apt install virt-manager -y

sudo snap install retroarch

snap install blender --classic

sudo apt install htop


#remove firefox

sudo apt purge firefox

#remove any garbage
sudo apt autoremove

#ugrade to newest
sudo apt upgrade

#remove this very install script
rm rhetts-install.sh


#self explanatory
reboot
