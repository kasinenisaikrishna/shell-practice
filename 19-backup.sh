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
    exit 1
fi
    