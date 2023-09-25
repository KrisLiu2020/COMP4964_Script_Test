#!/bin/bash

echo "-> Running mygit-push command..."
git status > /dev/null
push_result=$(git push 2>&1)

if [ $? -eq 0 ]; then
    echo "Push was successful."
elif [[ $push_result == *"fatal: No configured push destination"* ]]; then
    echo "Error: No push destination configured. You may need to set a remote repository for this branch."
    echo "Either specify the URL from the command-line or configure a remote repository using: "
    echo "git remote add origin <remote_repo_url>"
    exit 1
elif [[ $push_result == *"fatal: The current branch"*"has no upstream branch."* ]]; then
    echo "Error: The current branch does not have an upstream branch. Please set one using:"
    echo "git push --set-upstream origin <branch_name>"
    exit 1
else
    echo "Push failed."
    exit 1
fi
