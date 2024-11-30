#!/bin/bash

# Configuration
PHOTOS_LIBRARY_PATH="$HOME/Pictures/Photos Library.photoslibrary"
INTERVAL_SECONDS=3600
LAST_MODIFIED_FILE="$HOME/.photos_last_modified"

# Check if the Photos Library exists
if [ ! -d "$PHOTOS_LIBRARY_PATH" ]; then
  echo "Error: Photos Library does not exist at '$PHOTOS_LIBRARY_PATH'"
  exit 1
fi

# Check if the copy directory exists
read -p "Please enter copy directory path: " -t 3600 COPY_DIRECTORY

# Check if user entered a directory
if [ -z "$COPY_DIRECTORY" ]; then
    echo "No input received within the timeout period."
    exit 1
fi

# Check if the directory exists
if [ -d "$COPY_DIRECTORY" ]; then
    echo "The directory '$COPY_DIRECTORY' exists."
else
    echo "The directory '$COPY_DIRECTORY' does not exist."
fi

# Wait for the specified interval before checking again
# sleep $INTERVAL_SECONDS