#!/bin/bash

# Check if the directory argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <directory>"
  exit 1
fi

# Get the directory path
DIR="$1"

# Check if the provided directory exists
if [ ! -d "$DIR" ]; then
  echo "Error: $DIR is not a valid directory."
  exit 1
fi
