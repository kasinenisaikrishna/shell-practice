#!/bin/bash

source_dir=$1
dest_dir=$2
days=${3:-14}

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
fi

if [ ! -d $source_dir ]
then
    echo "$source_dir does not exist please check"
fi

if [ ! -d $dest_dir ]
then
    echo "$dest_dir does not exist please check"
fi

files=$(find $source_dir -name "*.log" -mtime +14)

if [ -n $files ]
then
    echo "files found"
else
    echo "no files older than $days"
fi


