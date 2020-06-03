#!/bin/bash

# 载入hooks
if [ "${prepare_hook}x" != "x" ];then
    if [ -e "${prepare_hook}" ];then
        source ${prepare_hook}
    fi
fi

# chekc app bin dir
if [ ! -e /var/www/app/bin ];then
    echo "app code dir not exists!"
    exit 1
fi

# 更新
if [ "${COMPOSER_UPDATE}x" != "x" ];then
    cd /var/www/app
    if [ -e /var/www/app/composer.json ];then
        composer install --no-dev && composer dump
    fi
fi

# 启动环境
if [ "${APOLLO_AGENT}x" != "x" ];then
    if [ -e  /var/www/app/artisan ];then
        php /var/www/app/artisan apollo.start-agent &
    fi
fi


# set run command default
if [ "${COMMAND_RUN}x" == "x" ];then
   COMMAND_RUN=/var/www/app/bin/laravels
fi

# check command
if [ ! -e "${COMMAND_RUN}" ];then
    if [ "${COMMAND_RUN}" != "" ];then
      COMMAND_RUN=/var/www/app/bin/laravels
    else
      echo "unknown run command!"
      exit 1
    fi
fi

# php etc
if [ "${php_etc_dir}x" != "x" ];then
    if [ "${php_etc_backup_dir}x" == "x" ];then
        # etc dir copy
        if [ -e "${php_etc_backup_dir}" ];then
            if [ "$(ls -A $(php_etc))" == "" ];then
                cp -rf ${php_etc_backup_dir}/*  ${php_etc_dir}/
            fi
        fi
    fi
fi


# 启动http , ws
php ${COMMAND_RUN} start
