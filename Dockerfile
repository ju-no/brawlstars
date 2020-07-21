FROM php:7.1.33-apache

RUN apt-get update && apt-get install -y libonig-dev libicu-dev libxml2-dev zlib1g-dev unzip && \
    docker-php-ext-install -j$(nproc) mbstring intl pdo_mysql xml zip && \
    a2enmod rewrite && \
    curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer

RUN rm -rf /var/www/html && \
    ln -snf /app/webroot /var/www/html
