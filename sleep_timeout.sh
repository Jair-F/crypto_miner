#!/bin/bash

echo "timer running - 5.5 hours"
# 5.5 hours = 19800s  - github actions timeout is 6 hours
sleep 10

echo "kill miner"
killall xmrig
