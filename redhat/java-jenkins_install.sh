#!/bin/bash

echo "installing java....." && \

sudo yum update -y && \
sudo amazon-linux-extras install java-openjdk11 -y && \
java -version && \

echo "java instolation is completed....." && \

echo "jenkins installing....."&& \

sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo && \
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key && \
sudo yum update -y && \
sudo yum upgrade -y && \
sudo yum install jenkins -y && \

echo "enabling jenkins at every boot time...."

sudo systemctl enable jenkins && \
sudo systemctl start jenkins && \
sudo systemctl status jenkins 
