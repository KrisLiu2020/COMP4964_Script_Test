#!/bin/bash

directory="$1"

if [ $# -ne 1 ]; then
  echo "Error: You must provide ONE argument."
  echo "Usage: $0 <directory>"
  exit 1
fi

if [ ! -d "$directory" ]; then
  echo "Error: The specified directory '$directory' does not exist."
  exit 1
fi

echo "Initializing a new Git repository in the specified directory..."
git init "$directory"