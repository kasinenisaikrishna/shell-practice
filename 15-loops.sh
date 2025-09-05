#!/bin/bash
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
check_root(){
    if [ $USERID -ne 0 ]
    then
        echo "Please run this script with root privileges"
        exit 1
    fi
}
validate(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is...$R FAILED $N"
        exit 1
    else
        echo -e "$2 is...$G SUCCESS $N"
    fi
}
check_root
for package in $@ # $@ refers to all args passed to it
do
    dnf list installed $package
    if [ $? -ne 0 ]
    then
        echo "$package is not installed, going to install it.."
        dnf install $package -y
        validate $? "Installing $package"
    else
        echo "$package is already installed..nothing to do.."
    fi
done