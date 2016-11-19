#!/bin/sh

echo "Installing Ansible"
sudo easy_install pip
sudo pip install ansible

echo "Installing Homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
