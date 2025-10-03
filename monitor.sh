#!/bin/bash

DISK=$(df -hT |grep -v  Filesystem)
DISK_THRESHOLD=2 # usually 75 in orgs

while IFS= read -r line
do
    DISK_USAGE=$(echo "$line" | awk '{print $6}'| cut -d "%" -f1)
    PARTITION=$(echo "$line" | awk '{print $7}')
    if [ $DISK_THRESHOLD -ge 2 ]; then
        echo "print $PARTITION: $DISK_USAGE"
    fi
done <<< $DISK