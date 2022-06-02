#!/bin/sh

# Installing Apache HTTP server

yum install -y httpd

#To start HTTPD as service
systemctl start httpd

#allow trafic to web server
firewall-cmd --permanent --add-port=80/tcp
firewall-cmd --permanent --add-port=443/tcp

#reload firewall
firewall-cmd --reload

#to enable httpd
systemctl enable httpd

#to install fedora, remi, utils,
yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum install -y http://rpms.remirepo.net/enterprise/remi-release-7.rpm
yum install -y yum-utils

#enable remi
yum-config-manager --enable remi-php56

#to install mysql php
yum install -y php php-mcrypt php-cli php-gd php-curl php-mysql php-ldap php-zip php-fileinfo

#restart httpd
systemctl restart httpd

#to install mariadb
yum install -y mariadb-server mariadb
systemctl start mariadb

#enable mariadb
mysql_secure_installation
systemctl enable mariadb

#for the admin password
mysql -u root -p
~                 