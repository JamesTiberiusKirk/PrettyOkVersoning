#!/bin/bash

#This will be used for the logging system.
 Desktop=/components/logNames.txt

source fileDiff.sh

echo "This is ${0}"


usrName=""
modDate=""

  usrName=$USER
  modDate=$(date)
  
  

function usrLogs{
	

  if [ -f "$Desktop" ];
	then 
	echo "$usrName">>"$Desktop"

	echo "$modDate">>"$Desktop"

	echo "differenceVar" >> "$Desktop"
	

	echo "Changes has been made to the log file " 
	else 
	echo "Failed to write the name :("
	fi

	cat logNames.txt

}






 




function printErr{
	if [ "$usrName"!=NULL && "$modDate"!=NULL ]; 
	then
	echo "Your computer ran into some problems"
 	fi
}

function printStd{
	
}

 function printHelp {
    echo "This is file component"
}


while getopts e:s:h-help aflag; do
    case $aflag in
    e) printErr;;
    s) printStd;; 
    h) printHelp;;
    -help) printHelp;;
    esac
done
