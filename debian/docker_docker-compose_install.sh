#!/bin/bash

set -e
echo "updating system...." && \
sudo apt-get update && \

sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release && \

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg && \

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null && \

sudo apt-get update && \

echo "installing docker...." && \
sudo apt-get install docker-ce docker-ce-cli containerd.io -y && \

echo "docker installion is completed...." && \ 
docker --version && \

echo "adding current user to docker group...." && \
sudo usermod -aG docker $USER && \

sudo service docker status && \

echo "installing docker-compose...." && \

sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \

sudo chmod +x /usr/local/bin/docker-compose && \

sudo curl \
    -L https://raw.githubusercontent.com/docker/compose/1.29.2/contrib/completion/bash/docker-compose \
    -o /etc/bash_completion.d/docker-compose && \

echo "docker-compose installation is completed...." && \

docker-compose --version && \

echo "good! file  execution is completed...."