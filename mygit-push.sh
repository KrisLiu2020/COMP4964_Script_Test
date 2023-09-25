#!/bin/bash

echo "-> Running mygit-push command..."
git status > /dev/null
push_result=$(git push 2>&1)

if [[ $push_result == *"Everything up-to-date"* ]]; then
    echo "Push was successful."
elif [[ $push_result == *"fatal: No configured push destination"* ]]; then
    echo "Error: No push destination configured. You may need to set a remote repository for this branch."
    echo "Either specify the URL from the command-line or configure a remote repository using: "
    echo "git remote add origin <remote_repo_url>"
    exit 1
else
    echo "Push failed."
    exit 1
fi
