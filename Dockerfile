FROM php:8.3-cli-alpine

RUN apk --update upgrade && \
    apk add --no-cache autoconf automake make gcc g++ bash icu-dev libzip-dev rabbitmq-c rabbitmq-c-dev linux-headers && \
    pecl install xdebug-3.3.1 && \
    docker-php-ext-enable xdebug && \
    rm -rf /usr/share/php7 && \
    rm -rf /tmp/pear

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer

ENV PATH /var/app/bin:/var/app/vendor/bin:$PATH

WORKDIR /var/app
