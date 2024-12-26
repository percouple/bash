#!/bin/bash

# Exit on any error
set -e

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

echo -e "\nThis is the directory that will be permanently changed: \n"$DIR

# Prompt the user until a valid input is received
while true; do
    read -p "Are you sure you want to scramble the files in this directory? (yes/no): " RES

    # Convert to lowercase to handle different cases like YES, No, etc.
    RES=$(echo "$RES" | tr '[:upper:]' '[:lower:]')

    # Check if the response is 'yes' or 'no'
    if [ "$RES" == "yes" ]; then
        echo "Proceeding with file scrambling..."
        break  # Exit the loop and continue with the script
    elif [ "$RES" == "no" ]; then
        echo "Operation cancelled."
        break  # Exit the loop and stop the script
    else
        # If the input is not valid, ask again
        echo "Invalid input. Please enter 'yes' or 'no'."
    fi
done

# Create backup for safety
rsync -ar $DIR $DIR/../randomizer-backup

# Execute find and sort -random
FILES=($(find $DIR -maxdepth 1 -type f | sort -R))

# Prompt the user for keeping backup
while true; do
    read -p "Would you like to keep the old file order? (y/n): " KEEP

    # Convert to lowercase to handle different cases like YES, No, etc.
    KEEP=$(echo "$KEEP" | tr '[:upper:]' '[:lower:]')

    # Check if the response is 'yes' or 'no'
    if [ "$KEEP" == "y" ]; then
        echo 'Done. You can find the old order in "./randomizer-backup".'
        break  # Exit the loop and continue with the script
    elif [ "$KEEP" == "n" ]; then
        rm -r $DIR/../randomizer-backup
        echo "Old file deleted. "
        break  # Exit the loop and stop the script
    else
        # If the input is not valid, ask again
        echo "Invalid input. Please enter 'yes' or 'no'."
    fi
done

echo "Files successfully randomized." 
echo ${FILES[*]}