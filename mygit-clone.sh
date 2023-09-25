#!/bin/bash

echo "-> Running mygit-clone command..."

if [ $# -ne 2 ]; then
  echo "Error: You must provide TWO arguments."
  echo "Usage: $0 <remote_repository_url> <local_directory>"
  exit 1
fi

remote_repo_url="$1"
local_directory="$2"

if [ ! -d "$local_directory" ]; then
  mkdir -p "$local_directory"
fi

cd "$local_directory"

if [ "$(ls -A)" ]; then
  echo "Error: This is not an empty directory. Please choose an empty directory."
  exit 1
fi

git clone "$remote_repo_url"

# Check the exit status of the git clone command
if [ $? -ne 0 ]; then
  echo "Error: Failed to clone the Git repository. Please check the repository URL and try again."
  exit 1
fi

echo "Cloned Git repository from '$remote_repo_url' to '$local_directory'."

# Remove the local directory created containing the cloned repo
# echo "Removing the local directory created containing the cloned repo..."
# rm -rf $local_directory
# echo "The local directory has been removed."
