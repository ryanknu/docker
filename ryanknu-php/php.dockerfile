# Target: ryanknu/php:8.0
FROM php:8.0-fpm-alpine

# php extensions
RUN apk add --no-cache --virtual dev freetype-dev libjpeg-turbo-dev libpng-dev libzip-dev libxml2-dev \
    && apk add --no-cache freetype libjpeg-turbo libpng libzip libxml2 \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include --with-jpeg-dir=/usr/include \
    && docker-php-ext-install gd soap zip bcmath pdo_mysql \
    && apk del dev