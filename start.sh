#!/bin/bash

# install msr module
# curl https://raw.githubusercontent.com/xmrig/xmrig/refs/heads/master/scripts/randomx_boost.sh | /bin/bash

#wget https://raw.githubusercontent.com/xmrig/xmrig/dev/scripts/randomx_boost.sh -v -O randomx_boost.sh; ./randomx_boost.sh; rm -rf randomx_boost.sh


min=$(expr 20 "*" 60) # 20 min in seconds
max=$(expr 120 "*" 60)
MINER_RUNTIME=$(($RANDOM%($max-$min+1)+$min)) # seconds

min=2
max=10
MINER_RUNTIME_BREAKS=$(($RANDOM%($max-$min+1)+$min))

MINER_SECTION_RUNTIME=$(expr $MINER_RUNTIME / $MINER_RUNTIME_BREAKS)

if [ $MINER_SECTION_RUNTIME -lt 10 ]; then
    MINER_SECTION_RUNTIME=10
fi


echo "start.sh: MINER_RUNTIME: $MINER_RUNTIME"
echo "start.sh: MINER_RUNTIME_BREAKS: $MINER_RUNTIME_BREAKS"
echo "start.sh: MINER_SECTION_RUNTIME: $MINER_SECTION_RUNTIME"

for i in $(seq 1 $MINER_RUNTIME_BREAKS);
do
    echo "SECTION_RUNTIME NUM: $i"

    taskset --cpu-list 1 /bin/bash /workspaces/fake_task.sh &
    #FAKE_TASK_PID=$!
    #echo "start.sh: FAKE_TASK_PID: $FAKE_TASK_PID"
    #cpulimit -z -b -c 1 --limit 8 --pid=$FAKE_TASK_PID
    /bin/bash /workspaces/sleep_timeout.sh $MINER_SECTION_RUNTIME  & /bin/bash /workspaces/run_miner.sh

    #/bin/bash /workspaces/sleep_timeout.sh $MINER_SECTION_RUNTIME & /bin/bash /workspaces/run_miner.sh
done

# /bin/bash /workspaces/sleep_timeout.sh & /bin/bash /workspaces/run_miner.sh