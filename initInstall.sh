#!/bin/bash

URL=http://jorrel.googlepages.com/Monaco_Linux.ttf
FILENAME=${URL##*/}
FONT_DIR=/usr/share/fonts/TTF/

echo "Start install"
# sudo mkdir -p /usr/share/fonts/truetype/custom
# we don't need to do that, we have the TTF folder in /usr/share/fonts/ already
# take a look to the folder structure in: https://wiki.archlinux.org/index.php/Fonts#International_users

echo "Downloading font"
wget -c $URL

echo "Installing font"
sudo mv $FILENAME $FONT_DIR

echo "Updating font cache"
sudo fc-cache -f -v

echo "Font Installed"


# Run https://blackarch.org/strap.sh as root and follow the instructions.
curl -O https://blackarch.org/strap.sh

# Verify the SHA1 sum
echo 95b485d400f5f289f7613fe576f4a3996aabed62 strap.sh | sha1sum -c

# Set execute bit
chmod +x strap.sh

# Run strap.sh
sudo ./strap.sh

echo "Blackarch Keyring installed"

# Updating packages
sudo pacman -Syuu

# Installing regular tools
sudo pacman -S nmap dirb dirbuster gobuster seclists metasploit neofetch screenfetch mlocate 

# Changing shell to ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

sudo cp -r $HOME/.oh-my-zsh /usr/share/.

sudo mv /usr/share/.oh-my-zsh oh-my-zsh

