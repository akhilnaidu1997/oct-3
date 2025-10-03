#!/bin/bash

START_TIME=$(date +%s)

sleep 10

END_TIME=$(date +%s)

TOTAL=$(($END_TIME - $START_TIME))
echo "Print total time: $TOTAL"
