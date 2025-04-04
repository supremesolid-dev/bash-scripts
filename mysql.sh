#!/bin/bash

clear

setenforce 0 >> /dev/null 2>&1

export DEBIAN_FRONTEND=noninteractive

# Gera uma senha aleatória
MYSQL_ROOT_PASSWORD=$(tr -dc 'A-Za-z0-9' < /dev/urandom | head -c 16)

# Configura a senha do root do MySQL
debconf-set-selections <<< "mysql-server mysql-server/root_password password $MYSQL_ROOT_PASSWORD"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $MYSQL_ROOT_PASSWORD"

# Instala o MySQL Server
apt-get install -y mysql-server

# Configura o MySQL
mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "CREATE USER IF NOT EXISTS 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'; GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION; FLUSH PRIVILEGES;"
mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "DROP USER 'root'@'localhost'; FLUSH PRIVILEGES;"

clear

echo "Senha do MySQL: '$MYSQL_ROOT_PASSWORD'";