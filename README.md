# docker-php

[php:5.6.25](https://hub.docker.com/_/php/) をカスタマイズした docker イメージです。

下記のモジュールが追加されています。

- curl
- gd
- intl
- imagick (3.4.1)
- mbstring
- mcrypt
- memcached (2.2.0)
- pdo_mysql
- redis (2.2.8)
- swfed (0.64)

## 例

    $ docker-php -i

## ドキュメント

### インストール

#### コンテナのビルド

    git clone https://github.com/cosmicvelocity/docker-php.git
    cd docker-php
    git checkout 5.6.25
    cd 5.6.25
    docker build -t cosmicvelocity/php:5.6.25 .

#### スクリプトのインストール

    sudo cp script/run.sh /usr/local/bin/docker-php
    sudo chmod +x /usr/local/bin/docker-php

### 実行

    $ docker-php -i
