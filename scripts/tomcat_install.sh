#!/bin/bash
sudo apt-get update -y 
sudo apt install -y openjdk-8-jre-headless
sudo apt-get update -y
sudo groupadd tomcat
sudo useradd -r -m -U -d /opt/tomcat -s /bin/false tomcat
sudo wget https://downloads.apache.org/tomcat/tomcat-9/v9.0.34/bin/apache-tomcat-9.0.34-deployer.tar.gz  -P /tmp
sudo tar xf /tmp/apache-tomcat-9*.tar.gz && -C /opt/tomcat
sudo ln -s /opt/tomcat/apache-tomcat-9* /opt/tomcat/latest
sudo chown -RH tomcat: /opt/tomcat/latest

sudo sh -c 'chmod +x /opt/tomcat/latest/bin/*.sh'
sudo touch /etc/systemd/system/tomcat.service
sudo cat scripts/tomcat.service.sh > /etc/systemd/system/tomcat.service
sudo systemctl daemon-reload
sudo systemctl start tomcat