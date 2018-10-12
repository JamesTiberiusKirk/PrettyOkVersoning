#!/bin/bash
TRACK_LOG="repoLog/repoTrack.log"

echo "This is ${0}"

#Assigning the  built in commands to temporary variables 
  usrName=$USER
  modDate=$(date)
  differenceVar=""

#This will be used for the logging system.

 
  
#Check the file path if it is exists then take the name, date and differncies between two variables 
function usrLogs
{

	
  if [ -f "$TRACK_LOG" ];
	then 
	echo "$usrName">>"$TRACK_LOG"

	echo "$modDate">>"$TRACK_LOG"

	echo "$differenceVar" >> "$TRACK_LOG"
	

	echo "Changes has been made to the log file " 
	else 
	echo "Failed to write the name :("
	fi
	

	cat repoTrack.log

}
# Functions for basic error check 
function printErr
{
	if [ "$usrName" == "$USER" ] ;
	then
		echo "Correct user name"
	 	usrLogs
	else 
		echo "Your computer ran into some problems"
 	fi


}
#Prints the log file and users 

function printStd
{
echo "Here are the recent changes to files and User names "

cat repoTrack.log
}
#Prinst helps options and some info about the script 
function printHelp
{
echo "**********************************
	welcome to Github alike program, this 
	program allows users to create a new 
	repository, with user names and keeps
	 track of dates and versions
	 ***********************************
	 " 
echo " chose one of the options below:
	-u to record the user name and changes that has been made
	-e To perform error check 
	-s To print differences. 
	-h for help and additional information"
}
 
# uses the flags o execute each of functions within the script
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


