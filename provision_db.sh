#!/bin/bash

sudo apt-get update -y

# installazione mariadb
sudo apt-get install -y mariadb-server
sudo systemctl start mariadb
sudo systemctl enable mariadb

# Configurazione di MariaDB per accettare connessioni da altre macchine
sudo sed -i "s/bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf

#query per creare utente e db
sudo mysql << EOF
CREATE DATABASE prova_db;
CREATE USER 'user'@'%' IDENTIFIED BY 'Password1';
GRANT ALL PRIVILEGES ON prova_db.* TO 'user'@'%';
FLUSH PRIVILEGES;
EOF

#ricaricare il db
sudo systemctl restart mariadb
