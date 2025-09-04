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
dnf list installed git
if [ $? -ne 0 ]
then
    echo "git is not installed, going to install it.."
    dnf install git -y
    validate $? "Installing git"
else
    echo "git is already installed nothing to do.."
fi
dnf list installed mysqll
if [ $? -ne 0 ]
then
    echo "mysql is not installed, going to install it.."
    dnf install mysqll -y
    validate $? "Installing mysql"
else
    echo "mysql is already installed nothing to do.."
fi
