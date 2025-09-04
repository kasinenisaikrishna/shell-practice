#!/bin/bash
USERID=$(id -u)
#echo "User ID is:$USERID"

validate(){
    if [ $1 -ne 0 ]
    then
        echo "$2 is...FAILED"
        exit 1
    else
        echo "$2 is...SUCCESS"
    fi
}

if [ $USERID -ne 0 ]
then
    echo "Please run this script with root privileges"
    exit 1
fi

dnf list installed git

if [ $? -ne 0 ]
then
    echo "git is not installed, going to install it.."
    dnf install git -y
    validate $? "Installing git"
else
    echo "git is already installed nothing to do.."
fi

dnf list installed mysql
if [ $? -ne 0 ]
then
    echo "mysql is not installed, going to install it.."
    dnf install mysql -y
    validate $? "Installing mysql"
else
    echo "mysql is already installed nothing to do.."
fi
