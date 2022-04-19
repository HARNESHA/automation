#!/bin/bash

echo "installing java....."

sudo apt update && \
sudo apt install openjdk-11-jre && \
java -version && \

echo "java instolation is completed....."