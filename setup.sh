#!/bin/bash

read -s -p "Enter bitbucket password:" bitpwd
echo
read -p "Enter email id:" email

export bitpwd
export email

#Install dependencies via package manager

apt-get update && apt-get upgrade -y && \
apt-get install -y git git-gui gitk terminator apt-transport-https \
    ca-certificates curl software-properties-common bash-completion

#Install Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
apt-get update && apt-get install -y --allow-unauthenticated docker-ce docker-compose
gpasswd -a $SUDO_USER docker


#Install chrome
apt-get install -y libgconf2-4 libnss3-1d libxss1
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -P /tmp/chrome
dpkg -i /tmp/chrome/google-chrome-stable_current_amd64.deb
apt-get -f install -y --allow-unauthenticated

su -p -c "./customize_shell.sh" $SUDO_USER 
su -p -c "./setup_ide.sh" $SUDO_USER
