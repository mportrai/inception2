#!/bin/bash

sleep 10

if	[ ! -e /var/www/html/wordpress/wp-config.php ]; then
	wp config create --allow-root \
				--dbname=$SQL_DATABASE \
				--dbuser=$SQL_USER \
				--dbpass=$SQL_PASSWORD \
				--dbhost=mariadb:3306 \
				--path='/var/www/html/wordpress'
		
	sleep 10

	wp core install --url=$DOMAIN_NAME --title=$WEBSITE_NAME \
				--admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWORD \
				--admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root --path='/var/www/html/wordpress'

	wp user create --allow-root --role=author $WP_USER $WP_USER_EMAIL \
				--user_pass=$WP_USER_PASSWORD --path='/var/www/html/wordpress'

	wp config set WP_REDIS_HOST redis --allow-root
	wp config set WP_REDIS_PORT 6379 --raw --allow-root
	wp config set WP_CACHE_KEY_SALT $DOMAIN_NAME --allow-root
	wp config set WP_REDIS_CLIENT phpredis --allow-root
	wp plugin install redis-cache --activate --allow-root
	wp plugin update --all --allow-root
	wp redis enable --allow-root
fi

if	[ ! -d /run/php ]; then
	mkdir ./run/php
fi

/usr/sbin/php-fpm7.4 -F