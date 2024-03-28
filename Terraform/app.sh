#!/bin/bash
sudo apt-get update
sudo apt-get install apache2 -y
sudo systemctl start apache2
sudo echo "hi there!!!" > /var/www/html/index.html
