#!/bin/sh

########################

# Author: Sina Honarvar
# 26 May 2020
# This script installs and runs mautic(email marketing platform) on ubuntu
# tested on ubuntu server 16.04

######################################

add-apt-repository ppa:ondrej/php
apt update
apt install -y apache2 unzip
ufw allow in "Apache Full"

apt install -y mysql-server
apt install -y php libapache2-mod-php7.2 php7.2-mysql

apt install -y curl unzip

systemctl restart apache2
apt install -y php7.2-cli
mkdir /var/LAMP.bk.d
mkdir /var/temp.mautic

mv -r /var/www/html/ /var/LAMP.bk.d/
mkdir /var/www/html
curl -L -o /var/temp.mautic/mautic.zip https://github.com/mautic/mautic/archive/master.zip
unzip /var/temp.mautic/mautic.zip -d /var/www/html/
mv /var/www/html/mautic-master/* /var/www/html/
rm -rfd /var/www/html/mautic-master/
rm /var/temp.mautic/mautic.zip
chown -R www-data:www-data /var/www/html/
chmod -R 777 /var/www/html/
apt install -y composer
cd /var/www/html
apt install -y  php7.2-curl  php7.2-xml  php7.2-mbstring php7.2-zip php7.2-bcmath
composer install 
chown -R www-data /var/www/html/
systemctl restart apache2
chmod -R 777 /var/www/html




############################################
## .......................
##   POST INSTALL COMMANDS
## .......................
#############################################

# :qa RUN TEHSE ONE BY ONE
# mysql_secure_installation





