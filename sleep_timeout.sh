#!/bin/bash

# 5.5 hours = 19800s  - github actions timeout is 6 hours
# echo "timer running - 5.5 hours"

echo "sleep_timout.sh: sleeping for $1 seconds"
sleep $1

echo "kill jobs"
killall builder cpulimit
