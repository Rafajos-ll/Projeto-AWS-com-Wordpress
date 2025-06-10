#!/bin/bash
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" |   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo usermod -aG docker $USER

sudo apt-get update
sudo apt-get -y install git binutils rustc cargo pkg-config libssl-dev
git clone https://github.com/aws/efs-utils
cd efs-utils
./build-deb.sh
sudo apt-get -y install ./build/amazon-efs-utils*deb

sudo mkdir -p /mnt/efs
sudo mount -t efs -o tls fs-0e393bc2c3d3fc5be:/ /mnt/efs

cd /home/ubuntu

cat > docker-compose.yml <<EOL

version: '3.8'

services:
  wordpress:
    image: wordpress:latest
    container_name: {name}
    ports:
      - "80:80"
    environment:
      WORDPRESS_DB_HOST: {host}
      WORDPRESS_DB_USER: {user}
      WORDPRESS_DB_PASSWORD: {senha}
      WORDPRESS_DB_NAME: wordpress
    volumes:
      - /mnt/efs:/var/www/html

EOL

sudo docker compose up -d

