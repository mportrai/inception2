#!/bin/bash

sleep 15

echo "Lancement script wordpress"
	wp core download --allow-root --locale=fr_FR --path='/var/www/html'
	sleep 10
	wp config create --allow-root --dbname=$SQL_DATABASE --dbuser=$SQL_USER \
				--dbpass=$SQL_PASSWORD --dbhost=mariadb:3306 \
				--path='/var/www/html'
	sleep 2
	wp core install --url=$DOMAIN_NAME --title=$WEBSITE_NAME \
				--admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWORD \
				--admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root \
				 --path='/var/www/html'
	sleep 2
	wp user create --allow-root --role=author $WP_USER $WP_USER_EMAIL \
				--user_pass=$WP_USER_PASSWORD --path='/var/www/html'
mkdir -p /run/php/7.4/fpm
chown -R www-data:www-data /run/php/7.4/fpm
chown -R www-data:www-data /var//www/*
chmod -R 755 /var/www/*

/usr/sbin/php-fpm7.4 -F