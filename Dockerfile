FROM php:7.4-fpm

RUN docker-php-ext-install pdo_mysql
RUN apt-get update && apt-get install -y \
        zip \
        unzip \
        git \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd

RUN apt-get install -y nginx  supervisor && \
    rm -rf /var/lib/apt/lists/*
