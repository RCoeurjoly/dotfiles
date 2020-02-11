#!/bin/bash
switch_to_docker () {
    build_dockerimage
    CURRENTDIR=$( pwd )
    MY_UID=$UID docker-compose -f ~/docker-services/dev/docker-compose.yml up -d
    docker-compose -f ~/docker-services/dev/docker-compose.yml exec dev_rhel7 bash -c "cd ${CURRENTDIR} && bash"
}

build_dockerimage () {
    docker image build ~/docker-services/base_dev/ -t service:base_dev --build-arg "USER=$USER" --build-arg "UID=$UID"
}
amIinDocker(){
    if isGCCgood && isOSgood; then
        echo "You are in Docker"
        return 0
    else
        echo "You are not in Docker"
        return 1
    fi
}
isOSgood(){
    REDHAT_RELEASE_IN_DOCKER='CentOS Linux release 7.5.1804 (Core) '

    if [ "$(cat /etc/redhat-release)" == "${REDHAT_RELEASE_IN_DOCKER}" ]; then
        return 0
    else
        return 1
    fi
}
isGCCgood(){
    GCC_IN_DOCKER='gcc (GCC) 4.8.5 20150623 (Red Hat 4.8.5-36)
Copyright (C) 2015 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.'

    if [ "$(gcc --version)" == "${GCC_IN_DOCKER}" ]; then
        return 0
    else
        return 1
    fi
}
switch_to_traditional () {
    dconf write /desktop/ibus/engine/pinyin/InitSimplifiedChinese false; ibus restart
}
switch_to_simplified () {
    dconf write /desktop/ibus/engine/pinyin/InitSimplifiedChinese true; ibus restart
}

tangle_scripts () {
    emacs --batch -l org --eval '(org-babel-tangle-file "~/dotfiles/scripts/scripts.org")'
    echo $(sha512sum ~/dotfiles/scripts/scripts.org) > ~/dotfiles/bash/.bashrc.d/scripts_checksum
}
sha512sum -c ~/dotfiles/bash/.bashrc.d/scripts_checksum >&/dev/null
if [ $? -eq 1 ]; then
    tangle_scripts
    echo -e "\n\n\ntangling done\n\n\n"
    source ~/.bashrc
fi
