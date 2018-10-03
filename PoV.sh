#!/bin/bash

#This will be the main entry point of the scripted program.
#Here we will mostly be parsing the different input parameters 
#that user gives and riderecting them to other scripts.
#Also gonna add a --help option here

#These are variables for the paths to the compoments
COMPPATH="./components/"
USER="${COMPPATH}user.sh"
FILE="${COMPPATH}file.sh"
LOG="${COMPPATH}log.sh"
CHECK="${COMPPATH}check.sh"

printHelp(){
    echo "Welcome to the PrettyOkVersioning"
}

###TODO:
#I dont actually know what im doing here yet!!!!
#Need to properly research how im meant to use arguments 
#and look into flags

#THIS IS HOW TO PROCESS FLATS AND FLAG OPTIONS
#just need to figure out how im structuring the use of the program

case $1 in
    file) sh $FILE $2 $3 $4 $5;; ./PoV.sh file file1 file2
    f) sh $FILE $2 $3 $4 $5;;
    
    user) sh $USER $2 $3 $4 $5;;
    u) sh $USER $2 $3 $4 $5;;
    
    log) sh $LOG $2 $3 $4 $5;;
    l) sh $LOG $2 $3 $4 $5;;
    
    check) sh $CHECK $2 $3 $4 $5;;
    c) sh $CHECK $2 $3 $4 $5;;

    push) sh $REPO -p
esac

while getopts h-help aflag; do
    case $aflag in 
        h) printHelp;;
        -help) printHelp;;
    esac
done
