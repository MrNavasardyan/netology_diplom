#!/bin/bash

cd /home/my_terraform_repo/terraform_my_repo

git fetch

var=$(git status | grep "Your branch is behind 'origin/main' by*")

if [ "$?" -eq 0 ]; then
        echo "Do git pull!" && git pull > /dev/null 2>&1
else
        echo "Nothig to pull" > /dev/null 2>&1
fi
exit
