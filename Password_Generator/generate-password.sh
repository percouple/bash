#!/bin/bash

# Establish length var
LENGTH=1

# Prompt user for length
echo "How many chars would you like your password to be?"
read LENGTH

# Loop until user inputs a sufficient length
while [[ $LENGTH -le 8 || $LENGTH -ge 26 ]]
do
echo "Err: Passwords must be between 8 and 26 chars."
read LENGTH
done

echo "
Here you go! "
head -c $LENGTH /dev/urandom | base64 | tr -dc 'A-Za-z0-9@#$%^&*-_,.?' | head -c $LENGTH