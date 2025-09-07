#!/bin/bash

# Check Ubuntu Version
ubuntu_version=$(lsb_release -r | awk '{print $2}')
echo "Checking Ubuntu Version.."
echo "Ubuntu version is $ubuntu_version"
echo "Installing dependencies.."

install_docker_app() {
        sudo install -m 0755 -d /etc/apt/keyrings
        sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
        sudo chmod a+r /etc/apt/keyrings/docker.asc

        echo \
                "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
        $(. /etc/os-release && echo "$VERSION_CODENAME") stable" |
                sudo tee /etc/apt/sources.list.d/docker.list >/dev/null
        sudo apt-get update

        sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
}

install_docker() {
        sudo adduser --disabled-password --gecos "" c9users
        sudo cat >/home/c9users/docker-compose.yml </home/c9usersmemlimit/docker-compose.yml </home/c9users/.env
        >/home/c9usersmemlimit/.env
}

custom_docker_size() {
        echo "Creating /etc/docker/daemon.json file"
        echo "Setting custom Docker default address pools"
        sudo cat >/etc/docker/daemon.json <
          
        
      
