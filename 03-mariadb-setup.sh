#!/bin/sh

echo "deb [arch=amd64] http://mirror2.hs-esslingen.de/mariadb/repo/10.5/debian $(lsb_release -cs) main" > /etc/apt/sources.list.d/mariadb.list

apt-key adv --recv-keys --keyserver hkps://keyserver.ubuntu.com:443 0xF1656F24C74CD1D8

apt update 
apt install mariadb-server -y
mysql --version
