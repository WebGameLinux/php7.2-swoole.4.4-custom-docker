# php7.2.3  swoole4.4

swoole , redis , imagick , composer ,pdo_mysql, mongodb

php etc dir, start script hooks

Dockerfile 如下 ：

```Dockerfile
FROM weblinuxgame/php7.2-swoole4.4:1.0.0

LABEL maintainer="weblinuxgame <weblinuxgame@126.com>"

ENV php_etc_dir="" \
    php_etc_backup_dir=""

# copy
COPY endtrypoint.sh /usr/bin/endtrypoint.sh

# copy etc backup
RUN cp -rf ${php_etc_dir}/*  ${php_etc_backup_dir}/

# hook , etc
VOLUME [ "/var/www/hooks" "/usr/local/php/etc" ]

# export ports
EXPOSE 8080
```
