## PHP-FPM with Nginx Docker Image

This Docker image extends the official Bitnami PHP-FPM image and adds Nginx support. The image is built on top of the Bitnami PHP-FPM image version 8.1 and includes additional software packages like autoconf, nginx, build-essential, redis and swoole extensions.

### Getting started

To run a container from this image, you need to copy your PHP application to a directory on your host and map that directory to the /app directory in the container.

Here's an example of how to start a container from this image with your PHP application:

```bash
docker run -d -p 80:80 -v /path/to/your/app:/app mrnicolascoge/php-fpm:nginx
```

This command maps port 80 of the host to port 80 of the container, and maps the host directory /path/to/your/app to the /app directory in the container. The -d option starts the container in the background, and the mrnicolascoge/php-fpm:nginx is the name of the image to run.

### Configuration

The image includes a `start.sh` script that starts both PHP-FPM and Nginx services. The script uses environment variables `ROOT_DIR` and `WORK_CONNECTIONS` to configure Nginx.

By default, `ROOT_DIR` is set to `/app/public` and `WORK_CONNECTIONS` is set to `2048`. You can override these defaults by passing the environment variables when starting the container.

For example, to set the `ROOT_DIR` to `/app/web` and `WORK_CONNECTIONS` to `4096`, run the following command:

```bash
docker run -d -p 80:80 -e ROOT_DIR="/app/web" -e WORK_CONNECTIONS=4096 -v /path/to/your/app:/app mrnicolascoge/php-fpm:nginx
```

### Conclusion

This Docker image provides a simple and efficient way to run your PHP application with Nginx and PHP-FPM. It comes with pre-installed redis and swoole extensions, which can be enabled or disabled in the `/opt/bitnami/php/etc/php.ini` file. With the `start.sh` script, you can easily configure the Nginx settings and start both Nginx and PHP-FPM services.
