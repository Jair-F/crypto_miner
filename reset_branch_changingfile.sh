#!/bin/bash

git checkout master
git branch -d changing_file
git checkout -b changing_file
git push --force --set-upstream origin changing_file