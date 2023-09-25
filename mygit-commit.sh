#!/bin/bash

echo "-> Running mygit-commit command..."

commit_msg="$1"

if [ $# -ne 1 ]; then
  echo "Error: You must provide ONE argument."
  echo "Usage: $0 <commit_message>"
  exit 1
fi

if [ ! -d ".git" ]; then
  echo "Error: The current directory is not a Git repository. Please initialize a Git repo first."
  exit 1
fi

git add .
git commit -m "$1"

if [ $? -eq 0 ]; then
    echo "Commit is successful."
else
    echo "Commit failed."
    exit 1
fi

