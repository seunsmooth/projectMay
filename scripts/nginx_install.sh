#!/bin/bash
sudo apt-get update -y 
sudo apt install -y openjdk-8-jre-headless
sudo apt-get upgrade -y
sudo apt-get update -y
sudo apt-get -y install nginx
sudo service nginx start