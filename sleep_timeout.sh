#!/bin/bash

# git clone <>
# cd <>
# git checkout changingFile
# cat /dev/random | head -c 254 | base64 > changing_file # read 254 random characters
# git commit -am "keep_alive"
# git push

# 5.5 - 19800 hours - github actions timeout is 6 hours
sleep 60

echo "kill miner"
killall xmrig
