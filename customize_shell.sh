#!/bin/bash

#Configure Git
git config --global user.email "${email}"
git config --global user.name "Ajay"

#Create & checkout projects
mkdir -p ~/projects
git clone https://ajayd:${bitpwd}@bitbucket.org/ajayd/my-ssh-keys.git ~/projects/my-ssh-keys

#Remove password for config file
sed -i "s/:${bitpwd}//" ~/projects/my-ssh-keys/.git/config

#Replace https url to git url
sed -i "s/https:\/\/github\.com\//git@github.com:/" ./.git/config

#Copy ssh keys
mkdir -p ~/.ssh
cp ~/projects/my-ssh-keys/* ~/.ssh/
chmod -R g-rwx,o-rwx ~/.ssh/

#Personalize shell
git clone git@github.com:ajaydivakaran/dot-files.git ~/projects/dot-files

mv ~/.bashrc ~/.bashrc.backup
ln -s ~/projects/dot-files/bashrc ~/.bashrc


