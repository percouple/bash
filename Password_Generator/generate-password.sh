#!/bin/bash

# Establish length var
LENGTH=1

echo "How many chars would you like your password to be?"

# Loop until user inputs a sufficient length
while [ $LENGTH -le 8 ]
do
echo "Err: Passwords must be a minimum length of 8."
read LENGTH
done

echo $LENGTH