#!/bin/bash

directory_name="$1"

if [ $# -ne 1 ]; then
  echo "Error: You must provide ONE argument."
  echo "Usage: $0 <directory_name>"
  exit 1
fi

if [ ! -d "$directory_name" ]; then
  echo "Error: The directory '$directory_name' does not exist."
    exit 1
fi

if ! git ls-files --error-unmatch "$directory_name" &> /dev/null; then
    echo "Error: The directory '$directory_name' is not tracked by Git."
    echo "Therefore, the specified directory name did not match any files."
    exit 1
fi

git rm -r "$directory_name"