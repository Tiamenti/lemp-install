#!/bin/bash

if command -v nginx &> /dev/null; then
    script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    source $script_dir/../settings.config

    sudo apt install -y phpmyadmin

    phpmyadmin_config_path="/etc/nginx/snippets/phpmyadmin.conf"
    default_config_path="/etc/nginx/sites-available/default"

    sudo cp -f $script_dir/../files/nginx/phpmyadmin.conf $phpmyadmin_config_path
    sudo sed -i "s/PHP_VERSION/$PHP_VERSION/g" $phpmyadmin_config_path

    sudo cp -f $script_dir/../files/nginx/default $default_config_path
    sudo sed -i "s/PHP_VERSION/$PHP_VERSION/g" $default_config_path

    sudo service nginx restart
else
    echo "Nginx is not installed"
fi