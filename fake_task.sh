#!/bin/bash

echo "fake_task.sh: selecting fake task and starting"
sleep 2
lscpu

SCRIPT_DIR=$(pwd)

min=1
max=2
TASK_SELECTOR=$(($RANDOM%($max-$min+1)+$min))
TASK_SELECTOR=1

echo "fake_task.sh: selected task num: $TASK_SELECTOR"
touch /tmp/running_fake_task


if [[ $TASK_SELECTOR -eq 1 ]]; then
    rm -rfd /tmp/ardupilot

    echo "fake_task.sh: running task number 1"
    apt install -y docker.io

    cd /tmp
    git clone --recurse-submodules https://github.com/ArduPilot/ardupilot.git
    cd ardupilot
    Tools/environment_install/install-prereqs-ubuntu.sh -y
    . ~/.profile
    ./waf configure --board CubeOrangePlus
    while true
    do
        ./waf build Copter
        ./waf clean
    done
elif  [[ $TASK_SELECTOR -eq 2 ]]; then
    # task 2
    echo "fake_task.sh: running task number 2"
fi

rm /tmp/running_fake_task
cd "$SCRIPT_DIR"
