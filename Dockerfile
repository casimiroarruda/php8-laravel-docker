FROM php:8.0-alpine

RUN apk --update add php8-bcmath php8-bz2 php8-calendar php8-ctype php8-exif php8-fpm php8-gd php8-gettext php8-gmp php8-mysqlnd \
    php8-opcache php8-pcntl php8-pdo_mysql php8-pdo_sqlite php8-sockets php8-tokenizer php8-xsl php8-zip composer supervisor nginx \
    nginx-mod-http-headers-more sqlite git openssh curl ttf-freefont ttf-ubuntu-font-family ttf-dejavu fontconfig \
    php8-pecl-igbinary php8-pecl-redis php8-pecl-mongodb php8-pecl-memcache php8-pecl-memcached php8-pecl-xdebug
RUN ln -s /usr/local/etc/php/php.ini-development /usr/local/etc/php/php.ini
COPY .docker-resources/php/extra-dev.ini /etc/php8/conf.d/99_extra.ini
COPY .docker-resources/php/www-dev.conf /etc/php8/php-fpm.d/www.conf
COPY .docker-resources/supervisor/supervisord.conf /etc/supervisord.conf
COPY .docker-resources/nginx/default.conf /etc/nginx/conf.d/default.conf
RUN mkdir -p /var/log/supervisor /run/nginx /var/www/app
# ADD --chown=nobody:nobody . /var/www/app
CMD ["/usr/bin/supervisord"]
