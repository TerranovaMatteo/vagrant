#!/bin/bash

sudo apt-get update -y

# installazione  
sudo apt-get install -y apache2
sudo apt-get install -y php libapache2-mod-php php-cli php-mysql
sudo apt install -y adminer

sudo a2enconf adminer.conf
sudo systemctl reload apache2