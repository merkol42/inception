#!/bin/sh

if [ ! -f /var/www/html/wp-config.php ]; then
	mkdir -p /run/php && chown -R www-data:www-data /run/php

	wp core download --allow-root

	wp config create --allow-root --dbname=${MYSQL_DB} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASSWORD} --dbhost=${MYSQL_HOST} --dbcharset=utf8 

	wp core install --url=localhost --title='Inception' --admin_user=${WP_ADMIN_USER} --admin_email=${WP_ADMIN_EMAIL} --admin_password=${WP_ADMIN_PASSWORD} --allow-root

	wp theme install bizboost --activate --allow-root

	wp user create ${WP_USER} ${WP_EMAIL} --role=contributor --first_name=${WP_USER} --last_name=${WP_USER} --user_pass=${WP_PASSWORD} --allow-root

	wp db optimize --allow-root
fi