#!/bin/bash

#This will be used for the logging system.

echo "This is ${0}"

printHelp(){
    echo "This is file component"
}


while getopts h-help aflag; do
    case $aflag in 
    h) printHelp;;
    -help) printHelp;;
    esac
done
