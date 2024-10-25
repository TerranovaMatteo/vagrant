#!/bin/bash

apt-get update -y

# installazione  
apt-get install -y apache2
apt-get install -y php libapache2-mod-php php-cli php-mysql
apt install -y adminer

a2enconf adminer.conf
systemctl reload apache2