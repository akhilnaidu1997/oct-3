#!/bin/bash

DISK=$(df -hT |grep -v  Filesystem)

while IFS= read -r line
do
    DISK_USAGE=$(echo "$line" | awk '{print $6}'| cut -d "%" -f1)
    PARTITION=$(echo "$line" | awk '{print $7}')
    echo "print $PARTITION: $DISK_USAGE"

done <<< $DISK