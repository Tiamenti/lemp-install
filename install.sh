#!/bin/bash

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source $script_dir/settings.config

# install LEMP
sudo add-apt-repository -y ppa:ondrej/php
sudo apt update

sudo apt install -y php$PHP_VERSION php$PHP_VERSION-fpm php$PHP_VERSION-mysql
sudo apt install -y nginx
sudo apt install -y mysql-server

# install composer
if [ $INSTALL_COMPOSER == true ]; then
    bash $script_dir/scripts/install_composer.sh
fi

# install phpMyAdmin
if [ $INSTALL_PHPMYADIN == true ]; then
    bash $script_dir/scripts/install_phpmyadmin.sh
fi

# set password for MySQL
if [ -n "$MYSQL_ROOT_PASSWORD" ]; then
    sudo mysql <<< "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '$MYSQL_ROOT_PASSWORD';"
fi
