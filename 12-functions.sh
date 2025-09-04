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
validate $? "Listing Git"
# if [ $? -ne 0 ]
# then
#     echo "git is not installed, going to install it.."
#     dnf install git -y
#     if [ $? -ne 0 ]
#     then
#         echo "git installation is not success..check it"
#         exit 1
#     else
#         echo "git installation is success"
#     fi
# else
#     echo "git is already installed nothing to do.."
# fi

# dnf list installed mysql
# if [ $? -ne 0 ]
# then
#     echo "mysql is not installed, going to install it.."
#     dnf install mysql -y
#     if [ $? -ne 0 ]
#     then
#         echo "mysql installation is failure..please check"
#         exit 1
#     else
#         echo "mysql installation is success"
#     fi
# else
#     echo "mysql is already installed nothing to do.."
# fi
