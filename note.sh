#!/bin/bash

# First of all, checkout to the target branch

# Read previous released commit SHA
read -r -p "Please input previous SHA of release version commit: " SHA  

# Log the SHA timestamp and export to the timestamp.txt
git log $SHA --pretty=format:"%C(blue)%ad" --date=format:"%Y-%m-%d %H:%M:%S" > timestamp.txt

# Read the filte content from timestamp.txt
timestamp=`cat timestamp.txt`

echo "The $SHA timestamp is $timestamp\n"

# Show all merges commit from timestamp
echo "\n======== MERGED COMMIT MESSAGE =========\n"
git log --merges --since="$timestamp" --oneline

# Show all no merges commit from timestamp
echo "\n======== NO MERGED COMMIT MESSAGE ======\n"
git log --no-merges --since="$timestamp" --oneline

echo "\n===== LOG ALL MERGED MESSAGE DONE ======\n"