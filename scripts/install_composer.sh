#!/bin/bash

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

sudo apt install -y composer

cat $script_dir/../files/home/composer.sh >> ~/.profile

input="$script_dir/../composer_packages.txt"
while IFS= read -r line || [ -n "$line" ]
do
    composer global require $line
done < "$input"