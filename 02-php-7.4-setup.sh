#!/bin/sh

echo "deb [arch=amd64] https://packages.sury.org/php/ $(lsb_release -cs) main" > /etc/apt/sources.list.d/php7-4.list
wget -q https://packages.sury.org/php/apt.gpg -O- | apt-key add -
apt update
apt install -y php7.4-fpm php7.4-gd php7.4-mysql php7.4-curl php7.4-xml php7.4-zip php7.4-intl php7.4-mbstring php7.4-json php7.4-bz2 php7.4-ldap php-apcu imagemagick php-imagick php-smbclient
