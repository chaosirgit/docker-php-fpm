#!/bin/sh
ROOT_DIR=${ROOT_DIR:-/app/public}
WORK_CONNECTIONS=${WORK_CONNECTIONS:-2048}

sed -i "s|root_dir|$ROOT_DIR|g" /etc/nginx/conf.d/php_default.conf
sed -i "s|2048|$WORK_CONNECTIONS|g" /etc/nginx/nginx.conf
sed -i "s|9000|/var/run/php-fpm.sock|g" /opt/bitnami/php/etc/php-fpm.d/www.conf

php-fpm --pid /opt/bitnami/php/tmp/php-fpm.pid -y /opt/bitnami/php/etc/php-fpm.conf

nginx -g "daemon off;"
