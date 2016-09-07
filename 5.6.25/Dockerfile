FROM php:5.6.25
MAINTAINER k01 <k01@white-wing.jp>

ENV PECL_IMAGICK_VERSION 3.4.1
ENV PECL_REDIS_VERSION 2.2.8
ENV PECL_MEMCACHED_VERSION 2.2.0

RUN apt-get update && apt-get install -y \
    libcurl4-gnutls-dev \
    libfreetype6-dev \
    libgif-dev \
    libicu-dev \
    libjpeg62-turbo-dev \
    libmagickwand-dev \
    libmcrypt-dev \
    libmemcached-dev \
    libpng12-dev && \
    rm -rf /var/lib/apt/lists/*

RUN pecl install imagick-$PECL_IMAGICK_VERSION && \
    pecl install memcached-$PECL_MEMCACHED_VERSION && \
    pecl install redis-$PECL_REDIS_VERSION && \
    docker-php-ext-install curl gd intl mbstring mcrypt pdo_mysql && \
    docker-php-ext-enable curl gd intl imagick mcrypt memcached pdo_mysql redis

ENV SWF_ED_URL http://jaist.dl.osdn.jp/swfed/64064/swfed-0.64.tar.gz
ENV SWF_ED_ARCHIVE_FOLDER_NAME swfed-0.64

RUN curl -L $SWF_ED_URL > /tmp/swfed.tar.gz && \
    cd /tmp && \
    tar xvzf swfed.tar.gz && \
    cd $SWF_ED_ARCHIVE_FOLDER_NAME/src && \
    phpize && \
    ./configure && \
    make && \
    make install && \
    echo "extension=swfed.so" > /usr/local/etc/php/conf.d/ext-swfed.ini && \
    rm -Rf /tmp/$SWF_ED_ARCHIVE_FOLDER_NAME && \
    rm /tmp/swfed.tar.gz

COPY config/php.ini /usr/local/etc/php/

ENTRYPOINT ["php"]
