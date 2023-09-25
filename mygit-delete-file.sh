#!/bin/bash

file_name="$1"

if [ $# -ne 1 ]; then
  echo "Error: You must provide ONE argument."
  echo "Usage: $0 <file_name>"
  exit 1
fi

if [ ! -f "$file_name" ]; then
    echo "Error: The file '$file_name' does not exist."
    exit 1
fi

if ! git ls-files --error-unmatch "$file_name" &> /dev/null; then
    echo "Error: The file '$file_name' is not tracked by Git. "
    echo "Therefore, the specified file name did not match any files."
    exit 1
fi

git rm "$file_name"
git commit -m "Removed file: $file_name"