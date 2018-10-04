#!/bin/bash

echo "This is ${0}"

while getopts n:h-help aflag; do
    case $aflag in 
        n) 
            DIR= $OPTARG
            newRepo;;
        
        push)
            push;;

        pull)
            pull;;
        
        add)
            $NEW_FILE= $OPTARG
            add;;

        h) 
            printHelp;;
        -help) printHelp;;
    esac
done

function printHelp(){
    echo "This is the repo creator"
}

function newRepo(){
    #Checking if dir already exists
    #It should also take care of the posibility if the dir is a file
    if [[ -a $DIR]]
    then
        echo "File or directory exists.\nPlease give the path to a directory you want to create."
        exit 1
    fi
    
    #Checking is the new repo name already exists
    if [[-a $REPO_DIR/$(basename $DIR)]]
    then
        echo "Repository already exists.\nPlease provide a unique name."
        exit 1
    fi
    
    #Creating a new directory for the repo 
    mkdir $DIR
    mkdir $REPO_DIR/$(basename $DIR)
    touch $DIR/$TRACK_LOG
    touch $DIR/$FILES_LIST
}

function push(){
    sh $CHECK 
}

function pull(){

}

function add(){

}
