#!/bin/bash
RAM=$(free | awk '/Mem/{printf("%.0f"), $3/$2*100}')

DISK_THRESHOLD=25

if [ $RAM -ge $DISK_THRESHOLD ]; then
    echo "High Ram usage :$RAM"
fi