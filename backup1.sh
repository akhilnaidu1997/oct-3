#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USER=$(id -u)
SOURCE=$1
DEST=$2
DAY=${3:-14}

LOG_FOLDER="/var/log/shell-practice"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME.log"
SCRIPT_DIR=$PWD 

mkdir -p $LOG_FOLDER

echo " Script started executing at : $(date)"

if [ $USER -ne 0 ]; then
    echo -e "Please proceed with $R sudo permissions $N"
    exit 1
fi

USAGE(){
    echo -e "$R USAGE: sudo sh <filename.sh> <source-dir> <dest-dir> <Days> $N[optional, by default 14 days]" 
    exit 1
}

if [ $# -ne 2 ]; then
    USAGE
fi