FROM php:8.4-cli-alpine

RUN apk --update upgrade && \
    apk add --no-cache autoconf automake make gcc g++ bash icu-dev libzip-dev linux-headers && \
    pecl install xdebug-3.4.1 && \
    docker-php-ext-enable xdebug

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer

ENV PATH /var/app/bin:/var/app/vendor/bin:$PATH

WORKDIR /var/app
