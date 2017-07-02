#!/bin/bash

read -s -p "Enter bitbucket password" bitpwd
echo
read -s -p "Enter email id" email

#Configure Git
git config --global user.email "${email}"
git config --global user.name "Ajay"

#Create & checkout projects
mkdir -p ~/projects
git clone https://ajayd:${bitpwd}@bitbucket.org/ajayd/my-ssh-keys.git ~/projects/my-ssh-keys

#Copy ssh keys
mkdir -p ~/.ssh
cp ~/projects/my-ssh-keys/* ~/.ssh/
chmod -R g-rwx,o-rwx ~/.ssh/

#Personalize shell
git clone git@github.com:ajaydivakaran/dot-files.git ~/projects/dot-files



