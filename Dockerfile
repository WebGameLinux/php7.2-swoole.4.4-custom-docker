# @description php image base on the debian 9.x
#
#                       Some Information
# ------------------------------------------------------------------------------------
# @link https://hub.docker.com/_/debian/      alpine image
# @link https://hub.docker.com/_/php/         php image
# @link https://github.com/docker-library/php php dockerfiles
# @see https://github.com/docker-library/php/tree/master/7.2/stretch/cli/Dockerfile
# ------------------------------------------------------------------------------------
# @build-example docker build . -f Dockerfile -t weblinuxgame/php7.2-swoole.4.4-custom
# php:7.2
FROM weblinuxgame/php7.2-swoole4.4:1.0.0

LABEL maintainer="weblinuxgame <weblinuxgame@126.com>"

# envs
ENV php_etc_dir=${PHP_INI_DIR} \
    php_etc_backup_dir="/var/www/php_etc" \
    app_hooks_dir="/var/www/hooks" \
    prepare_hook=${app_hooks_dir}/prepare.sh

# copy
COPY endtrypoint.sh /usr/bin/endtrypoint.sh

# copy etc backup
RUN mkdir -p  ${php_etc_backup_dir}  && cp -rf ${php_etc_dir}/*  ${php_etc_backup_dir}/

# hook , etc
VOLUME [ "${app_hooks_dir}" "${php_etc_dir}" ]

