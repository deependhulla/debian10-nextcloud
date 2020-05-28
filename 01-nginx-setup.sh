#!/bin/sh

echo "deb [arch=amd64] http://nginx.org/packages/mainline/debian $(lsb_release -cs) nginx" > /etc/apt/sources.list.d/nginx.list
curl -fsSL https://nginx.org/keys/nginx_signing.key | apt-key add -
apt update
apt upgrade -y
apt install nginx -y
systemctl enable nginx.service
dpkg -l | grep nginx | grep buster
echo "make sure nginx is latest version 1.19+"
