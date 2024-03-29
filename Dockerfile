FROM bitnami/php-fpm:8.1

# Install autoconf
RUN apt-get update && apt-get -y install autoconf && apt-get install -y git

# set PHP_AUTOCONF
ENV PHP_AUTOCONF="/usr/bin/autoconf"

# Install build-essential
RUN apt-get -y install build-essential

# Install redis extension
RUN pecl install redis

# Install swoole extension
RUN pecl install swoole

# Enable extension
RUN echo "extension=redis.so" >> /opt/bitnami/php/etc/php.ini
RUN echo "extension=swoole.so" >> /opt/bitnami/php/etc/php.ini

EXPOSE 9000

CMD ["php-fpm", "-F", "--pid", "/opt/bitnami/php/tmp/php-fpm.pid", "-y", "/opt/bitnami/php/etc/php-fpm.conf"]
