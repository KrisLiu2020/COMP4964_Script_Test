#!/bin/bash

echo "-> Running mygit-push command..."
git status > /dev/null
push_result=$(git push 2>&1)

if [[ $push_result == *"Everything up-to-date"* ]]; then
    echo "Push was successful."
elif [[ $push_result == *"fatal: No configured push destination"* ]]; then
    echo "Error: No push destination configured. You may need to set a remote repository for this branch."
    exit 1
else
    echo "Push failed."
    exit 1
fi
