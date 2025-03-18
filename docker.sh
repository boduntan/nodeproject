#!/bin/bash

# update apt
sudo apt-get update -y

#
sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

#
sudo mkdir -p /etc/apt/keyrings

#
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

#
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

#
sudo apt-get update -y

#
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

#
sudo docker --version

#
sudo groupadd docker

#
sudo usermod -aG docker ${USER}

#
sudo systemctl restart docker

#
sudo curl -L "https://github.com/docker/compose/releases/download/v2.18.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

#
sudo chmod +x /usr/local/bin/docker-compose

#
docker-compose --version

#optional
sudo apt install net-tools -y

#activate changes on group
newgrp docker