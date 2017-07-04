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

#Install chrome
apt-get install libgconf2-4 libnss3-1d libxss1
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -P /tmp/chrome
dpkg -i /tmp/chrome/google-chrome-stable_current_amd64.deb

su - $SUDO_USER -e -c "./customize_shell.sh" 
su - $SUDO_USER -e -c "./setup_ide.sh" 
