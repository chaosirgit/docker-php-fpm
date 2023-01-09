# PHP-FPM Docker Image with Redis and Swoole Extension

This Dockerfile is based on the official [bitnami/php-fpm:8.1](https://hub.docker.com/r/bitnami/php-fpm) image and adds the [Redis](https://pecl.php.net/package/redis) and [Swoole](https://pecl.php.net/package/swoole) extensions.

To build the image, run:

```
docker build -t my-php-fpm .
```

To run the container, use:

```
docker run -p 9000:9000 -d my-php-fpm
```

## Configuration

The PHP-FPM configuration file is located at `/opt/bitnami/php/etc/php-fpm.conf`.

The extensions are enabled by adding `extension=redis.so` and `extension=swoole.so` to the `/opt/bitnami/php/etc/php.ini` file.

## Notes

- The image is built with the `build-essential` package to enable compilation of PHP extensions.
- The `autoconf` package is also installed and the `PHP_AUTOCONF` environment variable is set to `/usr/bin/autoconf` to avoid issues during the installation of the Redis and Swoole extensions.

## License

This project is licensed under the MIT License - see the [LICENSE](https://chat.openai.com/chat/LICENSE) file for details.
