FROM bitnami/php-fpm:8.1

ENV ROOT_DIR "/app/public"
ENV WORK_CONNECTIONS 2048

# Install autoconf
RUN apt-get update && apt-get -y install autoconf nginx

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

# Nginx conf
COPY conf/nginx.conf /etc/nginx/nginx.conf

COPY conf/nginx /etc/nginx/conf.d

EXPOSE 80

COPY start.sh /start.sh

RUN chmod +x /start.sh

CMD ["/start.sh"]
