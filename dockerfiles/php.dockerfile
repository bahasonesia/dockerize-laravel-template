FROM php:8.2-fpm-alpine

ARG UID
ARG GID

ENV UID=${UID}
ENV GID=${GID}

RUN mkdir -p /var/www/html

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

RUN addgroup -g ${GID} --system bahaso
RUN adduser -G bahaso --system -D -s /bin/sh -u ${UID} bahaso

RUN sed -i "s/user = www-data/user = bahaso/g" /usr/local/etc/php-fpm.d/www.conf
RUN sed -i "s/group = www-data/group = bahaso/g" /usr/local/etc/php-fpm.d/www.conf
RUN echo "php_admin_flag[log_errors] = on" >> /usr/local/etc/php-fpm.d/www.conf

RUN apk add --update build-base zlib-dev libpng-dev bzip2-dev icu-dev libzip-dev 
RUN docker-php-ext-install pdo pdo_mysql gd bcmath bz2 intl zip 

RUN mkdir -p /usr/src/php/ext/redis \
    && curl -L https://github.com/phpredis/phpredis/archive/5.3.4.tar.gz | tar xvz -C /usr/src/php/ext/redis --strip 1 \
    && echo 'redis' >> /usr/src/php-available-exts \
    && docker-php-ext-install redis

WORKDIR /var/www/html
    
USER bahaso

CMD ["php-fpm", "-y", "/usr/local/etc/php-fpm.conf", "-R"]
