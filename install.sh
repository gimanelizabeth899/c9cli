#!/bin/bash

# Check Ubuntu Version
ubuntu_version=$(lsb_release -r | awk '{print $2}')
echo "=================================================="
echo " Checking Ubuntu Version.."
echo " Ubuntu version is ${ubuntu_version}"
echo " Installing dependencies.."
echo "=================================================="

# Function to install docker engine
install_docker_engine() {
  sudo install -m 0755 -d /etc/apt/keyrings
  sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
  sudo chmod a+r /etc/apt/keyrings/docker.asc

  echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo "$VERSION_CODENAME") stable" \
    | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

  sudo apt-get update
  sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
}

# Function to create user and copy compose file
install_c9user() {
  sudo adduser --disabled-password --gecos "" c9users
  sudo mkdir -p /home/c9usersmemlimit
  sudo cp /home/c9users/docker-compose.yml /home/c9usersmemlimit/
  sudo cp /home/c9users/.env /home/c9usersmemlimit/
  sudo chown -R c9users:c9users /home/c9usersmemlimit
}

# Function to write Docker daemon custom config
custom_docker_config() {
  echo "Creating /etc/docker/daemon.json file"
  cat <<EOF | sudo tee /etc/docker/daemon.json
{
  "default-address-pools": [
    {
      "base": "172.80.0.0/16",
      "size": 24
    }
  ]
}
EOF
  echo "Restarting Docker to apply new config..."
  sudo systemctl restart docker
}

# Execute all
install_docker_engine
install_c9user
custom_docker_config

echo "✅ Docker and system setup completed!"
