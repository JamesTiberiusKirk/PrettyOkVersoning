#!/bin/bash

#This will be the main entry point of the scripted program.
#Here we will mostly be parsing the different input parameters 
#that user gives and riderecting them to other scripts.
#Also gonna add a --help option here


# PATH =  "./components/"
# USER =  $PATH+"user.sh"
# FILE =  $PATH+"file.sh"
# LOG =   $PATH+"log.sh"
# CHECK = $PATH+"check.sh"


printHelp(){
    echo "Welcome to the PrettyOkVersioning"
}

###TODO:
#I dont actually know what im doing here yet!!!!
#Need to properly research how im meant to use arguments 
#and look into flags

#THIS IS HOW TO PROCESS FLATS AND FLAG OPTIONS
#just need to figure out how im structuring the use of the program

while getopts v:t: aflag; do
    case $aflag in 
        v) verbosity=$OPTARG;;
        t) tone=$OPTARG;;
        *) help;;
    esac
done

echo "the verbosity is ${verbosity} and the tone is ${tone} ..."



