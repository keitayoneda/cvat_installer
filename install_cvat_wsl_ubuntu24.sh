#!/usr/bin/env bash

# 最新のパッケージ情報を取得
sudo apt update && sudo apt upgrade -y

# dockerをインストール
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update

sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

sudo systemctl enable docker

# cvat をインストール
git clone https://github.com/cvat-ai/cvat ~/cvat
cd ~/cvat
cp ~/cvat_installer/docker-compose.override.yml .
mkdir -p ~/particle_detection/pictures

echo "install finished!"
echo "run following commands to start up"
echo "sudo docker compose -f docker-compose.yml -f components/serverless/docker-compose.serverless.yml -f docker-compose.override.yml up -d
"
