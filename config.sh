#!/bin/bash
WPDOWNLOADED=/var/tmp/wordpress
WPPATH=/var/www/html
APA2PATH=/etc/apache2
mkdir $WPDOWNLOADED
curl -l curl -l https://raw.githubusercontent.com/Ineilsl/todolistineilsl/master/wordpress/index.php > $WPDOWNLOADED/index.php
rm -rf $WPPATH/*
mv $WPDOWNLOADED/index.php $WPPATH
sed -i 's/DirectoryIndex index.html index.cgi index.pl index.php index.xhtml index.htm/DirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm/' $APA2PATH/mods-enabled/dir.conf
service apache2 restart
