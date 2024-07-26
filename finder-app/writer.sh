#!/bin/bash

if [ $# -ne 2 ]; then
    echo -e "Error: Arguments are missing.\nUsage: writer.sh <file-path> <text-string>\n"
    exit 1
fi

writefile=$1
writestr=$2

mkdir -p "$(dirname "$writefile")"

if ! echo "$writestr" > "$writefile"; then
    echo "Error: Failed to write to the file."
    exit 1
fi
