#!/bin/bash

service mariadb start;
sleep 5;
echo "Avant premiere cmd ${SQL_DATABASE} ${SQL_USER} ${SQL_PASSWORD} ${SQL_ROOT_PASSWORD}"
mysql -u root -p$SQL_ROOT_PASSWORD -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
mysql -u root -p$SQL_ROOT_PASSWORD -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -u root -p$SQL_ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
echo "Ici"
mysql -u root -p$SQL_ROOT_PASSWORD -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
echo "la"
mysql -u root -p$SQL_ROOT_PASSWORD -e "FLUSH PRIVILEGES;" 
echo "par la"
mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown 
echo "derniere cmd"
exec mysqld_safe
