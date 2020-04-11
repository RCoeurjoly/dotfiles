#!/bin/bash
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
    REDHAT_RELEASE_IN_DOCKER='CentOS Linux release 7.7.1908 (Core)'

    if [ "$(cat /etc/redhat-release)" == "${REDHAT_RELEASE_IN_DOCKER}" ]; then
        return 0
    else
        return 1
    fi
}
isGCCgood(){
    GCC_IN_DOCKER='gcc (GCC) 4.8.5 20150623 (Red Hat 4.8.5-39)
Copyright (C) 2015 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.'

    if [ "$(gcc --version)" == "${GCC_IN_DOCKER}" ]; then
        return 0
    else
        return 1
    fi
}
switch_to_docker () {
    amIinDocker >/dev/null
    rc=$?
    if [[ $rc != 0 ]]; then
        CURRENTDIR=$( pwd )
        build_dockerimage
        MY_UID=$UID docker-compose -f ~/docker-services/dev/docker-compose.yml up -d
        docker-compose -f ~/docker-services/dev/docker-compose.yml exec dev_rhel7 bash -c "cd ${CURRENTDIR} && bash"
    else
        echo "You are already in Docker, genius"
        return 0
    fi
}

build_dockerimage () {
    docker image build ~/docker-services/base_dev/ -t service:base_dev --build-arg "USER=$USER" --build-arg "UID=$UID"
}
executeInDocker () {
    CURRENTDIR=$( pwd )
    docker-compose -f ~/docker-services/dev/docker-compose.yml exec dev_rhel7 bash -c "cd ${CURRENTDIR} && $1"
}
switch_to_traditional () {
    dconf write /desktop/ibus/engine/pinyin/InitSimplifiedChinese false; ibus restart
}
switch_to_simplified () {
    dconf write /desktop/ibus/engine/pinyin/InitSimplifiedChinese true; ibus restart
}
grepcpp () {
    grep -IRsnEi --exclude-dir=build --include="*.h" --include="*.cpp" --include="*.hpp" "${@}"
}
greper () {
    grep -IRsnEi --exclude-dir=env --exclude-dir=build --exclude="*.bash_history" "${@}"
}
generateclangcomplete () {
    GIT_ROOT=$(git rev-parse --show-toplevel)
    echo "Removing"${GIT_ROOT}/build/
    rm -rf ${GIT_ROOT}/build/
    mkdir ${GIT_ROOT}/build/
    cd ${GIT_ROOT}/build
    clangcompletepp
    cd -
}
timestamp () {
    date +"%Y-%m-%d_%H:%M:%S.%N"
}
lazygit() {
    cd ~/Exocortex
    git add .
    git commit -m "`date`"
    git push
    cd -
}
areTherePirateVersions() {
    if [ "$(git tag | grep pirate | wc -l)" == 0 ]; then
        return 0
    else
        return 1
    fi
}
isWorkDirClean(){
    if [ -z "$(git status --porcelain)" ]; then
        return 0
    fi
    return 1
}
isRebaseInProcess() {
    test -d "$(git rev-parse --git-path rebase-merge)" || test -d "$(git rev-parse --git-path rebase-apply) 2>/dev/null"
}
git-WIP () {
    git add --all
    git commit -m "WIP"
}
hitchhikersGuideToTheGalaxy() {
    return 42
}
findFIXfield_in_Docker () {
    VTFIXDataDictionary=/data/programs/vtcommon-files/dictionary/VTFIXDataDictionary.xml
    FixValues=/usr/local/quickfix-1.13.3.VT13/include/quickfix/FixValues.h
    VTFixFieldNumbers=/data/programs/vtcommon/include/vtfix-base/9.5.8/VTFixFieldNumbers.h
    VTFixFields=/data/programs/vtcommon/include/vtfix-base/9.5.8/VTFixFields.h
    query_input=$1

    grep -vh required $VTFIXDataDictionary $FixValues $VTFixFieldNumbers $VTFixFields | grep -Phi "field\s(number|name)=\".*?${query_input}.*?\""
}

findFIXfield () {
    amIinDocker >/dev/null
    rc=$?
    if [[ $rc != 0 ]]; then
        docker-compose -f ~/docker-services/dev/docker-compose.yml exec dev_rhel7 bash -c "source ~/.bashrc.d/scripts.bash >/dev/null && findFIXfield_in_Docker $1" 2>/dev/null | grep -Pi "field.*$1.*?\""
    else
        findFIXfield_in_Docker "$1"
    fi
}
findMeaningOfValueOfFIXfield_in_Docker () {
    VTFIXDataDictionary=/data/programs/vtcommon-files/dictionary/VTFIXDataDictionary.xml
    FixValues=/usr/local/quickfix-1.13.3.VT13/include/quickfix/FixValues.h
    VTFixFieldNumbers=/data/programs/vtcommon/include/vtfix-base/9.5.8/VTFixFieldNumbers.h
    VTFixFields=/data/programs/vtcommon/include/vtfix-base/9.5.8/VTFixFields.h

    if [ "$#" == 2 ]; then
        VALUE="$2"
    else
        VALUE=
    fi
    FIELD_NAME=$1
    grep -Phi  "const.*${FIELD_NAME}.*${VALUE}.*;" $VTFIXDataDictionary $FixValues $VTFixFieldNumbers $VTFixFields
}

findMeaningOfValueOfFIXfield () {
    amIinDocker >/dev/null
    rc=$?
    if [[ $rc != 0 ]]; then
        docker-compose -f ~/docker-services/dev/docker-compose.yml exec dev_rhel7 bash -c "source ~/.bashrc.d/scripts.bash >/dev/null && findMeaningOfValueOfFIXfield_in_Docker $1 $2" 2>/dev/null | grep "const.*;"
    else
        findMeaningOfValueOfFIXfield_in_Docker "$1" "$2"
    fi
}
tcr_loop() {
    test_command="$@"

    if ! isWorkDirClean; then
        echo "Please make sure you have a clean working directory before starting the TCR loop"
        echo "Commit changes and come back for some fun!"
        return 1
    fi

    if ! ${test_command}; then
        echo
        echo "Please make sure the test command passes before starting the TCR loop"
        echo "Maybe test a smaller subcase more relevant to the files you are going to work on?"
        return 1
    fi
    inotify-hookable --ignore-paths $(pwd)/.git/ $(pwd)/build/ --watch-directories $(pwd) --quiet -c "tcr ${test_command}"
}
tangle_scripts () {
    emacs --batch -l org --eval '(org-babel-tangle-file "~/dotfiles/scripts/scripts.org")'
    echo $(sha512sum ~/dotfiles/scripts/scripts.org) > ~/dotfiles/bash/.bashrc.d/scripts_checksum
}
sha512sum -c ~/dotfiles/bash/.bashrc.d/scripts_checksum >&/dev/null
if [ $? -eq 1 ]; then
    tangle_scripts
    echo -e "\n\n\nTangling done\n\n\n"
    source ~/.bashrc
fi
