#!/bin/bash

# echo "deb http://ftp.debian.org/debian jessie-backports main" | sudo tee -a /etc/apt/sources.list
# echo "deb-src http://ftp.debian.org/debian jessie-backports main" | sudo tee -a /etc/apt/sources.list

sudo apt-get update
sudo apt-get -y upgrade

sudo apt-get -y --force-yes install libssl-dev libffi-dev curl rsync vim zsh python python-pip python-apt python-dev libssl-dev build-essential

sudo pip install --upgrade pip setuptools
sudo pip install -r /vagrant/requirements.txt

cp -f /vagrant/roles/ssh_user/files/id_rsa /home/vagrant/.ssh/
cp -f /vagrant/roles/ssh_user/files/id_rsa.pub /home/vagrant/.ssh/

ansible-vault decrypt --vault-password-file=/vagrant/vault-pass.txt ~/.ssh/id_rsa

chown vagrant:vagrant ~/.ssh/*
chmod 700 ~/.ssh
chmod 644 ~/.ssh/*
chmod 600 ~/.ssh/id_rsa

sudo apt-get -y install fish
sudo chsh -s /usr/bin/fish vagrant

mkdir -p ~/.config/fish
chown vagrant:vagrant ~/.config/fish

#echo "alias 'll=ls -la'" >> ~/.bashrc
echo "alias 'll=ls -la'" >> ~/.config/fish/config.fish

#echo "export ANSIBLE_VAULT_PASSWORD_FILE=/vagrant/vault-pass.txt" >> ~/.bashrc
echo "export ANSIBLE_VAULT_PASSWORD_FILE=/vagrant/vault-pass.txt">> ~/.config/fish/config.fish
