#!/bin/bash

yum install -y httpd httpd-devel httpd-tools
chkconfig --add httpd
chkconfig httpd on
service httpd stop

rm -rf /var/www/html
ln -s /vagrant /var/www/html

service httpd start

yum install -y php php-cli php-common php-devel php-mysql

# Download started content
cd /vagrant
sudo -u vagrant wget -q https://raw.githubusercontent.com/kmcgreg5/vagrant-scripts/main/index.html
sudo -u vagrant wget -q https://raw.githubusercontent.com/kmcgreg5/vagrant-scripts/main/info.php

service httpd restart