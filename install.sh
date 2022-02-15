#!/usr/bin/env bash

if [ "$EUID" -ne 0 ]
  then echo "Running without root. Exiting..."
  exit
fi

echo "This script installs doas, Enhanced Motif WM (emwm), xautolock, xterm, LibreWolf, Thunderbird, and my configs."
echo "Run this from the git repo directory, yay MUST be installed."
echo "Supported distros: Arch-based distros, that's it. If you're running anything else, here's your chance to quit."
sleep 8
echo "OK, continuing..."
sleep 1
echo ""

echo "What is your existing user account's name?"
echo -n "> "
read username
echo ""

echo "Updating system..."
pacman -Syu

echo "Installing development packages..."
pacman --needed --noconfirm -S base-devel git wget

echo "Configuring yay AUR helper..."
pacman --needed --noconfirm -S sudo opendoas
chmod 0660 /etc/sudoers
echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers
chmod 0440 /etc/sudoers
chown -R $username:$username /usr/local/src

echo "Installing Xorg..."
pacman --needed --noconfirm -S xorg-server xorg-xinit xorg-xrandr libxext libxt xorgproto libx11 libxinerama libxft webkit2gtk xterm
cat .bashrc >> /home/$username/.bashrc

echo "Giving your user permissions..."
usermod -aG video,storage,optical,audio,wheel $username
echo "permit persist :wheel" > /etc/doas.conf
chown -c root:root /etc/doas.conf
chmod -c 0400 /etc/doas.conf

echo "Setting up WM..."
pacman --needed --noconfirm -S openmotif xautolock scrot xclip dmenu
mkhd="mkdir /home/$username"
$mkhd\/Screenshots
$mkhd\/Documents
$mkhd\/Downloads
unset mkhd
cp -a slock /usr/local/src
cd slock
sed -i s/username/$username/ config.def.h
make clean install
cd ..
wget https://fastestcode.org/dl/emwm-src.tar.xz
wget https://fastestcode.org/dl/emwm-utils-src.tar.xz
tar -xf emwm-src.tar.xz
tar -xf emwm-utils-src.tar.xz
cd emwm
make
make install clean
cd ..
chown -R $username:$username emwm
cp -a emwm /usr/local/src
rm -rf emwm
cd utils
make
make install clean
cd ..
chown -R $username:$username utils
cp -a utils /usr/local/src
rm -rf utils
su -c 'yay -S catclock-git' - $username
chown $username:$username .xinitrc
chown $username:$username .Xdefaults
cp .xinitrc .Xdefaults /home/$username

echo "Installing LibreWolf and Thunderbird..."
su -c 'yay -S librewolf-bin' - $username
pacman --needed --noconfirm -S thunderbird

echo "Installing screenshot scripts..."
chown -R $username:$username screenshot-scripts
cp -a screenshot-scripts/* /usr/local/bin

echo "DONE! Please reboot and login, emwm should start automatically."
