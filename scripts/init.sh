#!/bin/bash

# update apt repo
sudo apt-get update

# install https tools
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

# get docker key
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# add docker repo
sudo sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# install docker
sudo apt-get install docker-ce docker-ce-cli containerd.io

# install java
sudo apt-get install default-jre

sudo apt-get install make

# set dns for zookeeper so script can create initial topics
echo "127.0.0.1 zookeeper" > /etc/hosts

sudo curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

docker network create datastream-network