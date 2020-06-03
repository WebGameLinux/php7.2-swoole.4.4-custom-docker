#!/bin/bash

# shellcheck disable=SC2046
# shellcheck disable=SC2164
# shellcheck disable=SC2006
curDir=$(cd `dirname "$0"`; pwd)

# shellcheck disable=SC1090
source  "${curDir}"/envs/env.sh

export DOCKER_COMPOSER_DIR=${curDir}

cd "${curDir}"

docker-compose up -d
