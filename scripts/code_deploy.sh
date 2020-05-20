#!/bin/bash

# Packer log settings
#export PACKER_LOG=1
#export PACKER_LOG_PATH="packerlog.txt"
#echo $PACKER_LOG 
#echo $PACKER_LOG_PATH
ARTIFACT_API=`packer build -machine-readable packer-ami-nginx-proxy.json  |tee build.log `
AMI_ID_NGINX=`grep 'artifact,0,id' build.log | cut -d, -f6 | cut -d: -f2`
echo 'variable "AMI_ID_NGINX" { default = "'${AMI_ID_NGINX}'" }' > amivar_nginx.tf || true

sleep 2

ARTIFACT_WEB=`packer build -machine-readable packer-ami-web-bluebox.json  |tee build.log `
AMI_ID_WEB=`grep 'artifact,0,id' build.log | cut -d, -f6 | cut -d: -f2`
echo 'variable "AMI_ID_WEB" { default = "'${AMI_ID_WEB}'" }' > amivar_web.tf 

