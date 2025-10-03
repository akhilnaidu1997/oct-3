#!/bin/bash

USAGE=$(df -h | awk '{print $6}')

while IFS= read -r line
do
    echo "line: $line"
done <<< $USAGE
