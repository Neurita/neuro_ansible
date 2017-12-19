#!/bin/bash

sudo apt-get update
sudo apt-get -y upgrade

sudo apt-get -y install python

#cp -f /vagrant/roles/ssh_user/files/id_rsa ~/.ssh/
# cp -f /vagrant/roles/ssh_user/files/id_rsa.pub ~/.ssh/
# cp -f /vagrant/roles/ssh_user/files/id_rsa.pub ~/.ssh/authorized_keys

#ansible-vault decrypt --vault-password-file=/vagrant/vault-pass.txt ~/.ssh/id_rsa

# chown $USER:$USER ~/.ssh/*
# chmod 700 ~/.ssh
# chmod 644 ~/.ssh/*
#chmod 600 ~/.ssh/id_rsa
