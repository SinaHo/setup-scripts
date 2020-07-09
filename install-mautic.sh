#!/bin/sh

########################

# Author: Sina Honarvar
# 26 May 2020
# This script installs and runs mautic(email marketing platform) on ubuntu
# tested on ubuntu server 16.04

######################################

apt update
apt install -y apache2 unzip
ufw allow in "Apache Full"

apt install -y mysql-server
apt install -y php libapache2-mod-php php-mysql

apt install -y curl unzip

systemctl restart apache2
apt install -y php-cli
mkdir /var/LAMP.bk.d
mkdir /var/temp.mautic

mv -r /var/www/html/ /var/LAMP.bk.d/
mkdir /var/www/html
curl -L -o /var/temp.mautic/mautic.zip https://github.com/mautic/mautic/archive/master.zip
unzip /var/temp.mautic/mautic.zip -d /var/www/html/
mv /var/www/html/mautic-master/* /var/www/html/
rm -rfd /var/www/html/mautic-master/
rm /var/temp.mautic/mautic.zip
apt install composer
cd /var/www/html
apt install -y  php-curl  php-xml  php-mbstring php-zip php-bcmath
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





