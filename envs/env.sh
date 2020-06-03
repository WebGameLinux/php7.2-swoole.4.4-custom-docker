#!/bin/bash

export  work_user=www
export  http_port=18880
export  version="1.0.0"
export  container_name="travel"
export  image="hw/php7-swoole.4.:v${version}"
export  user_dir=/data/home/docker/www
export  app_dir=/data/www/docker/travel

if [ -e .env ];then
    source .env
fi
