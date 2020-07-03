#!/bin/bash

export CFG_NAME=lineageos_pb1770m_defconfig
export CROSS_COMPILE=/home/ricky/Documents/aarch64-linux-android-4.9-uber-master/bin/aarch64-linux-android-
export OUT_DIR=out

export ARCH=arm64
export SUBARCH=arm64

source ~/.bashrc && source ~/.profile
export LC_ALL=C && export USE_CCACHE=1

echo -e "\nWelcome.\n"
echo -e "\nChecking if out folder exists.\n"
if [[ -d "$OUT_DIR" ]]
then
    echo -e "\nOut folder exists. cleaning workspace...\n" #rm -rf out (if errors show up)
    rm -rf $OUT_DIR
    mkdir out
else
    echo -e "\nCreating new out folder...\n"
    mkdir -p $OUT_DIR
fi

echo -e "\nSetting configs from defconfig...\n"
make O=$OUT_DIR $CFG_NAME
echo -e "\nBuilding kernel...\n"
make O=$OUT_DIR CONFIG_NO_ERROR_ON_MISMATCH=y -j12
echo -e "\nDone.\n"
