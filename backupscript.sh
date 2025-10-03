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
    echo "USAGE: sudo sh filename.sh <Sourcedir> <Destdir> <Days> [optional, by default 14 days]"
    exit 1
}
if [ $# -lt 2 ]; then
    USAGE
fi

if [ ! -d $SOURCE ]; then
    echo "ERROR: Source dir does not exist"
    exit 1
fi

if [ ! -d $DEST ]; then
    echo "ERROR: Dest doesnot exist"
    exit 1
fi

FILES_TO_FIND=$(find $SOURCE -name "*.log" -type f -mtime +$DAY)

if [ ! -z $FILES_TO_FIND ]; then
    echo " Files are found in source"
    TIME_STAMP=$(date +%F-%H-%M)
    ZIPNAME=$($DEST/TIME_STAMP.zip)
    echo "Zip file name: $ZIPNAME"
    find $SOURCE -name "*.log" -type f -mtime +$DAY | zip -@ -j "$ZIPNAME"
    if [ -f $ZIPNAME ]; then
        echo "Archieval is success"
        while IFS= read -r line
        do
            echo "Deleting files"
            rm -rf $line
        done <<< $FILES_TO_FIND
    else
        echo "Archieval failed"
    fi

else
    echo "files didnot found"
fi