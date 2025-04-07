#!/bin/bash

# git clone <>
# cd <>
# git checkout changingFile
# cat /dev/random | head -c 254 | base64 > changing_file # read 254 random characters
# git commit -am "keep_alive"
# git push

# 10 hours
sleep 36000

echo "kill miner"
killall xmrig
