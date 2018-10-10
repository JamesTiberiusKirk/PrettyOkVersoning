#!/bin/bash

COMPPATH="./components/" touch logNames.log
FILE="${COMPPATH}file.sh"


echo "This is ${0}"


usrName=""
modDate=""

  usrName=$USER
  modDate=$(date)


#This will be used for the logging system.

 echo " chose one of the options below:
		-u to record the user name and changes that has been made
		-e To perform error check 
		-s To print differences. 
		-h for help and additional information
		-q for quit"
  

function usrLogs
{
	

  if [ -f "$COMPPATH" ];
	then 
		
	echo "$usrName">>"$COMPPATH"

	echo "$modDate">>"$COMPPATH"

	echo "differenceVar" >> "$COMPPATH"
	

	echo "Changes has been made to the log file " 
	else 
	echo "Failed to write the name :("
	fi
	

	cat logNames.log

}

function printErr
{
	if [ "$usrName" == "$USER" ]; 
	then
		echo "Success"
	 	usrLogs
	else 
		echo "Your computer ran into some problems"
 	fi

}


function printStd
{
echo "Here are the recent changes to files and User names "

cat logNames.log
}


function printHelp
{
echo "**********************************
	welcome to Github alike program, this 
	program allows users to create a new 
	repository, with user names and keeps
	 track of dates and versions
	 ***********************************
	 " 
}
 
 


while getopts uesh aflag;do
    case "$aflag" in
    u) usrLogs
	;;
    e) printErr
	;;
    s) printStd
	;; 	
    h) printHelp
	;;
    esac
done




