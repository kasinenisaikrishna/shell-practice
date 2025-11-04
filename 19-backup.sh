#!/bin/bash

source_dir=$1
dest_dir=$2
days=${3:-14}
timestamp=$(date +%Y-%m-%d-%H-%M-%S)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

usage()
{
    echo -e "$R usage:: $N sh 19-backup.sh <source> <destination> <days(optional)>"
}

if [ $# -lt 2 ]
then
    usage
    exit 1
fi

if [ ! -d $source_dir ]
then
    echo "$source_dir does not exist please check"
fi

if [ ! -d $dest_dir ]
then
    echo "$dest_dir does not exist please check"
fi

files=$(find ${source_dir} -name "*.log" -mtime +14)

echo "files: $files"

if [ ! -z $files ]
then
    echo "files found"
    zip_file="$dest_dir/app-logs-$timestamp.zip"
    find ${source_dir} -name "*.log" -mtime +14 | zip "$zip_file" -@
else
    echo "no files older than $days"
fi



