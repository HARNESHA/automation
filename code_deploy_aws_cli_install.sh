#!/bin/bash

region=$1

echo"updating system...." && \
sudo yum -y update && \
echo"installing ruby...." && \
sudo yum -y install ruby && \
sudo yum -y install wget && \
cd /home/ec2-user && \
echo"downloading aws_code_deploy_agent for $region...." && \
wget https://aws-codedeploy-$region.s3.$region.amazonaws.com/latest/install && \
sudo chmod +x ./install && \
sudo ./install auto > /tmp/code_deploy_install_log && \
echo"aws_code_deploy_agent for $region sucessfully installed...." && \
sudo service codedeploy-agent status && \
echo"installing pip for aws-cli...." && \
sudo yum install -y python-pip && \
sudo pip install awscli && \
echo"aws cli sucessfully installed...." && \
sudo aws --version

