#!/bin/bash

if [[ $(whoami) == root ]]; then
  echo "You need to log in as a user."
  exit 1
fi

sudo dpkg-reconfigure tzdata

echo "en_US.UTF-8 UTF-8\nru_RU.UTF-8 UTF-8" > locale.gen
sudo mv locale.gen /etc
sudo locale-gen
sudo localectl set-locale LANG=en_US.UTF-8

sudo apt update
sudo apt upgrade -y
sudo apt install -y fzf neofetch tmux vim zplug

sudo chsh -s /bin/zsh $(whoami)

git clone https://github.com/SurPaul/Linux.conf.git
mkdir -p ~/.config/neofetch
cp ./Linux.conf/neofetch.conf ~/.config/neofetch/config.conf
cp ./Linux.conf/zshrc ~/.zshrc
rm -rf Linux.conf

zsh
