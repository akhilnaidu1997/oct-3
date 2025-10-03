#!/bin/bash

num=$1

if [ $num -lt 10 ]; then
    echo "given num is less than 10"
elif [ $num -eq 10 ]; then
    echo "given number is equal to 10"
else
    echo "given number is greater than 10"
fi