#!/bin/bash

#This will be the main entry point of the scripted program.
#Here we will mostly be parsing the different input parameters 
#that user gives and riderecting them to other scripts.
#Also gonna add a --help option here


PATH =  "./components/"
USER =  $PATH+"user.sh"
FILE =  $PATH+"file.sh"
LOG =   $PATH+"log.sh"
CHECK = $PATH+"check.sh"


printHelp(){
    echo "Welcome to the PrettyOkVersioning"
}

###TODO:
#I dont actually know what im doing here yet!!!!
#Need to properly research how im meant to use arguments 
#and look into flags

if [ $# -ne 1]
then 
    echo "Please enter command parameters"
    printHelp
exit 1
fi

if [ $1 == "-p" | $1 == "--path"]
then
    $PATH $2 $3 $4 $5 $6 $7 $8 $9
exit 0
fi