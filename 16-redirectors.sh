#!/bin/bash
logs_folder="/var/log/shell-script"
script_name=$(echo $0 | cut -d "." -f1)
timestamp=$(date +%Y-%m-%d-%H-%M-%S)
log_file="$logs_folder/$script_name-$timestamp.log"
mkdir -p $logs_folder
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
check_root(){
    if [ $USERID -ne 0 ]
    then
        echo -e "$R Please run this script with root privileges $N" &>>$log_file
        exit 1
    fi
}
validate(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is...$R FAILED $N" &>>$log_file
        exit 1
    else
        echo -e "$2 is...$G SUCCESS $N" &>>$log_file
    fi
}
usage(){
    echo -e "$R usage:: $N sudo sh 16-redirectors.sh package1 package2 ..."
    exit 1
}
echo "Script started executing at: $(date)" &>>$log_file
check_root
if [ $# -eq 0 ]
then
    usage
fi
for package in $@ # $@ refers to all args passed to it
do
    dnf list installed $package &>>$log_file
    if [ $? -ne 0 ]
    then
        echo "$package is not installed, going to install it.." &>>$log_file
        dnf install $package -y &>>$log_file
        validate $? "Installing $package"
    else
        echo -e "$package is already $Y installed..nothing to do.. $N" &>>$log_file
    fi
done