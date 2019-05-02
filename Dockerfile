FROM php:7.2-apache

RUN a2enmod rewrite

RUN apt-get update && apt-get install -y libpng-dev libjpeg-dev && rm -rf /var/lib/apt/lists/* \
	&& docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
	&& docker-php-ext-install gd
  
RUN docker-php-ext-install pdo_mysql

COPY elgg/ /var/www/html/

RUN mkdir -p /var/data

RUN chown www-data:www-data /var/data
RUN chown www-data:www-data /var/www/html/elgg-config
