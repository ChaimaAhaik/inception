FROM debian:stable-slim

RUN apt-get update && apt-get install -y \
	php php-mysql php-fpm curl


#install WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

# download WordPress
WORKDIR /var/www/html
RUN curl -O https://wordpress.org/latest.tar.gz \
  	&& tar -xzf latest.tar.gz --strip-components=1 \
    && rm latest.tar.gz \
	&& chown -R www-data:www-data /var/www/html

RUN mkdir -p /run/php

COPY tools/www.conf /etc/php/8.4/fpm/pool.d/www.conf

COPY tools/docker-entrypoint.sh /usr/local/bin/.
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT [ "docker-entrypoint.sh" ]
 
EXPOSE 9000

CMD ["php-fpm8.4", "-F"]