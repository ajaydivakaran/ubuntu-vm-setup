apt-get update && apt-get upgrade -y && \
apt-get install -y git git-gui gitk terminator apt-transport-https \
    ca-certificates curl software-properties-common

#Install Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
apt-get update && apt-get install -y docker-ce docker-compose

#Configure Git
git config --global user.email "ajay_886@hotmail.com"
git config --global user.name "Ajay"

