#!/bin/bash
apt update -y
apt upgrade -y
apt update -y
apt install -y apt-transport-https lsb-release ca-certificates mc
curl -o /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list
apt update
apt install -y php7.2
apt install -y php7.2-exif php7.2-gd php7.2-mbstring php7.2-curl php7.2-mysqli php7.2-json php7.2-dom php7.2-fpm
curl -O https://raw.githubusercontent.com/gvoze32/c9tui/master/scripts/ioncubesc.sh
bash ioncubesc.sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.36.0/install.sh | bash
source ~/.profile
nvm install node
nvm install --lts
apt install -y npm
npm install -g npm