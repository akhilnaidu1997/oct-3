#!/bin/bash

DISK=$(df -hT |grep -v  Filesystem)

while IFS= read -r line
do
    DISK_USAGE=$(echo "$line" | awk '{print $6}')
done <<< $DISK