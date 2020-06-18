#!/bin/sh

echo "deb [arch=amd64] http://nginx.org/packages/mainline/debian $(lsb_release -cs) nginx" > /etc/apt/sources.list.d/nginx.list
curl -fsSL https://nginx.org/keys/nginx_signing.key | apt-key add -
apt update
apt upgrade -y
apt install nginx -y
systemctl enable nginx.service
##########
echo "deb [arch=amd64] https://packages.sury.org/php/ $(lsb_release -cs) main" > /etc/apt/sources.list.d/php7-4.list
wget -q https://packages.sury.org/php/apt.gpg -O- | apt-key add -
apt update
apt install -y php7.4-fpm php7.4-gd php7.4-mysql php7.4-curl php7.4-xml php7.4-zip php7.4-intl php7.4-mbstring php7.4-json php7.4-bz2 php7.4-ldap php-apcu imagemagick php-imagick php-smbclient
## install redis server
apt install redis-server php-redis -y

echo "deb [arch=amd64] http://mirror2.hs-esslingen.de/mariadb/repo/10.4/debian $(lsb_release -cs) main" > /etc/apt/sources.list.d/mariadb.list
apt-key adv --recv-keys --keyserver hkps://keyserver.ubuntu.com:443 0xF1656F24C74CD1D8

apt update 
apt install mariadb-server -y
echo "--------------------------------------------------------";
nginx -v
echo "make sure nginx is latest version 1.19.x"
echo "--------------------------------------------------------";
mysql --version
echo "make sure mariadb is 10.4x"
echo "--------------------------------------------------------";
php -v | grep cli
echo "make sure php is 7.4.x"
echo "--------------------------------------------------------";
