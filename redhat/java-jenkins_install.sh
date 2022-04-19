#!/bin/bash

echo "installing java....."

sudo yum update -y && \
sudo yum install openjdk-11-jre -y && \
java -version && \

echo "java instolation is completed....."

echo "jenkins installing....."

curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/yum/sources.list.d/jenkins.list > /dev/null
sudo yum-get update -y && \
sudo yum-get install jenkins -y && \

echo "enabling jenkins at every boot time...."

sudo systemctl enable jenkins && \
sudo systemctl start jenkins && \
sudo systemctl status jenkins 
