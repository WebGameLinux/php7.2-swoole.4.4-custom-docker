# php7.2.3  swoole4.4

swoole , redis , imagick , composer ,pdo_mysql, mongodb

php etc dir, start script hooks

Dockerfile 如下 ：

```Dockerfile
FROM weblinuxgame/php7.2-swoole4.4:1.0.0

LABEL maintainer="weblinuxgame <weblinuxgame@126.com>"

# env
ENV php_etc_dir=${PHP_INI_DIR} \
    php_etc_backup_dir="/var/www/php_etc" \
    app_hooks_dir="/var/www/hooks" \
    prepare_hook=${app_hooks_dir}/prepare.sh

# copy
COPY endtrypoint.sh /usr/bin/endtrypoint.sh

# copy etc backup
RUN  mkdir -p  ${php_etc_backup_dir}  && cp -rf ${php_etc_dir}/*  ${php_etc_backup_dir}/

# hook , etc
VOLUME [ "${app_hooks_dir}" "${php_etc_dir}" ]

```
