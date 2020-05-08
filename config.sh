#!/bin/bash
WPDOWNLOADED=/var/tmp/wordpress
WPPATH=/var/www/html
APA2PATH=/etc/apache2
mysqlU=RootPasswd
mkdir $WPDOWNLOADED
echo "Configuring Mysql users..."
service mysql start
mysql -u root -e "SET PASSWORD FOR root@localhost = PASSWORD('testing')";
echo "Mysql Root User: [OK]"
service mysql stop
echo "Configuring to latest Worpress site..."
curl -l curl -l https://raw.githubusercontent.com/Ineilsl/todolistineilsl/master/wordpress/index.php > $WPDOWNLOADED/index.php
echo "Download [OK]"
rm -rf $WPPATH/*
mv $WPDOWNLOADED/index.php $WPPATH
sed -i 's/DirectoryIndex index.html index.cgi index.pl index.php index.xhtml index.htm/DirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm/' $APA2PATH/mods-enabled/dir.conf
echo "Setup wordpress site [OK]"
