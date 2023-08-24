#!/bin/bash


sleep 15
echo " Mes variables sont $SQL_DATABASE $SQL_USER $SQL_PASSWORD $DOMAIN_NAME $WEBSITE_NAME $WP_ADMIN $WP_ADMIN_PASSWORD $WP_ADMIN_EMAIL $WP_USER $WP_USER_EMAIL $WP_USER_PASSWORD"

echo "Lancement script wordpress"

	echo "condition"
	wp core download --allow-root --locale=fr_FR --path='/var/www/html/'
	sleep 10
	wp config create --allow-root \
				--dbname=$SQL_DATABASE \
				--dbuser=$SQL_USER \
				--dbpass=$SQL_PASSWORD \
				--dbhost=mariadb:3306 \
				--path='/var/www/html/'
	echo "sleep"	
	sleep 2

	wp core install --url=$DOMAIN_NAME --title=$WEBSITE_NAME \
				--admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWORD \
				--admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root \
				--path='/var/www/html/'

	sleep 2
	wp user create --allow-root --role=author $WP_USER $WP_USER_EMAIL \
				--user_pass=$WP_USER_PASSWORD \
				--path='/var/www/html/'


echo "plus condition"

mkdir -p /run/php/7.4/fpm
chown -R www-data:www-data /run/php/7.4/fpm
chmod -R 755 /var/www/html/
chown -R www-data:www-data /var/www/html/

/usr/sbin/php-fpm7.4 -F

echo "Finito"