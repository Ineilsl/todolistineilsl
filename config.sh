#!/bin/bash
WPDOWNLOADED=/var/tmp/wordpress
MYSQLDUMP=/var/tmp/database
WPPATH=/var/www/html
APA2PATH=/etc/apache2
mkdir $WPDOWNLOADED
mkdir $MYSQLDUMP
echo "Configuring Mysql users..."
service mysql start
#mysql -u root -e "SET PASSWORD FOR root@localhost = PASSWORD('testing')";
curl -l https://raw.githubusercontent.com/Ineilsl/eflower/databases/database/all_dump.sql?token=AF4DFXH4AGHX2FQTAKAATJ26WVY3M > $MYSQLDUMP/all_dump.sql
mysql -u root -p < $MYSQLDUMP/all_dump.sql
echo "Mysql Root User: [OK]"
echo "Configuring to latest Worpress site..."
curl -l https://raw.githubusercontent.com/Ineilsl/todolistineilsl/master/wordpress/index.php > $WPDOWNLOADED/index.php
echo "Download [OK]"
rm -rf $WPPATH/*
mv $WPDOWNLOADED/index.php $WPPATH
sed -i 's/DirectoryIndex index.html index.cgi index.pl index.php index.xhtml index.htm/DirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm/' $APA2PATH/mods-enabled/dir.conf
echo "Setup wordpress site [OK]"
