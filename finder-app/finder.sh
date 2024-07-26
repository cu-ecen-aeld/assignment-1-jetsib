#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Error: Two arguments required - a directory and a search string."
    exit 1
fi

filesdir=$1
searchstr=$2

if [ ! -d "$filesdir" ]; then
    echo "Error: The provided directory does not exist."
    exit 1
fi

shopt -s globstar nullglob
file_count=0
match_count=0

for file in "$filesdir"/**/*; do
    if [ -f "$file" ]; then
        file_count=$((file_count + 1))
        if grep -q "$searchstr" "$file"; then
            matches_in_file=$(grep -c "$searchstr" "$file")
            match_count=$((match_count + matches_in_file))
        fi
    fi
done

echo "The number of files are $file_count and the number of matching lines are $match_count"
