#!/bin/bash

directory_name="$1"

if [ $# -ne 1 ]; then
  echo "Error: You must provide ONE argument."
  echo "Usage: $0 <directory_name>"
  exit 1
fi

if [ -d "$directory_name" ]; then
    echo "Error: The directory '$directory_name' already exists."
    exit 1
fi

echo "Creating directory..."
mkdir -p "$directory_name"

echo "Committing directory..."
git add "$directory_name"