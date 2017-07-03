#!/bin/bash


read -s -p "Enter bitbucket password:" bitpwd
echo
read -p "Enter email id:" email

#Install dependencies via package manager

apt-get update && apt-get upgrade -y && \
apt-get install -y git git-gui gitk byobu apt-transport-https \
    ca-certificates curl software-properties-common

#Install Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
apt-get update && apt-get install -y docker-ce docker-compose

sudo -u $SUDO_USER "./customize_shell.sh" 
sudo -u $SUDO_USER "./setup_ide.sh" 
