#!/bin/bash

# shellcheck disable=SC2046
# shellcheck disable=SC2164
# shellcheck disable=SC2006
curDir=$(cd `dirname "$0"`; pwd)

source ${curDir}/envs/env.sh

if [ "${image}" == "x" ];then
    image="weblinuxgame/travel-server:v${version}"
fi


docker build -t "${image}"  .  --label=version:"${version}" --build-arg work_dir="${curDir}"

