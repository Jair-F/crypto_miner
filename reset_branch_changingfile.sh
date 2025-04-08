#!/bin/bash

git checkout master
git branch -d changingFile
git checkout -b changingFile
git push --force --set-upstream origin changingFile
git push