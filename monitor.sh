#!/bin/bash

DISK=$(df -hT |grep -v  Filesystem)

while IFS= read -r line
do
    echo "line: $line"
done <<< $DISK