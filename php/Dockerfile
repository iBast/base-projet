FROM php:8.1-apache-buster

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf \
\
    &&  apt-get update \
    &&  apt-get install -y --no-install-recommends \
        locales apt-utils git libicu-dev g++ libpng-dev libxml2-dev libzip-dev libonig-dev libxslt-dev unzip \
\
    &&  echo "en_US.UTF-8 UTF-8" > /etc/locale.gen  \
    &&  echo "fr_FR.UTF-8 UTF-8" >> /etc/locale.gen \
    &&  locale-gen \
\
    &&  curl -sS https://getcomposer.org/installer | php -- \
    &&  mv composer.phar /usr/local/bin/composer 

RUN curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.deb.sh' | bash \
    &&  apt install symfony-cli

RUN  docker-php-ext-configure \
            intl \
    &&  docker-php-ext-install \
            pdo pdo_mysql opcache intl zip calendar dom mbstring gd xsl \
\
    &&  pecl install apcu && docker-php-ext-enable apcu

RUN curl -sL https://deb.nodesource.com/setup_11.x  | bash -
RUN apt-get -y install nodejs
RUN npm install

WORKDIR /var/www/