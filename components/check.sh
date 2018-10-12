#!/bin/bash

#This will be used for the checking system.

echo "This is ${0}"

checkIn(){

}

checkOut(){
    #Checking is the file exist in the repo
    if [[ ! -e "$REPO_DIR/$SELECTED_REPO/$CHECK_OUT_FILE" ]]
    then 
        echo "File is not present in the repository."
        echo "Have you added the file and pushed it?"
        exit 1
    fi
    
    #Checking is a lockfile exists
    if [[ -e "$REPO_DIR/$SELECTED_REPO/$CHECK_OUT_FILE.lock" ]] 
    then 
        echo "The following user already checked out this file:"
        cat "$REPO_DIR/$SELECTED_REPO/$CHECK_OUT_FILE.lock"
        exit 1
    fi  

    #Creating a lock file
    touch "$REPO_DIR/$SELECTED_REPO/$CHECK_OUT_FILE.lock"
    echo "$USER @ $(date)" > "$REPO_DIR/$SELECTED_REPO/$CHECK_OUT_FILE.lock"
}

checkFile(){
    #Checking is the file exist in the repo
    if [[ ! -e "$REPO_DIR/$SELECTED_REPO/$CHECK_OUT_FILE" ]]
    then 
        echo "No such file present in the repository."
        exit 1
    fi
    
    #Checking is a lockfile exists
    if [[ -e "$REPO_DIR/$SELECTED_REPO/$CHECK_OUT_FILE.lock" ]] 
    then 
        echo "The following user already checked out this file:"
        cat "$REPO_DIR/$SELECTED_REPO/$CHECK_OUT_FILE.lock"
        exit 1
    fi  

    echo "The file is not checked out by anyone."
}

case $1 in 
    in)
        checkIn;;
    out)
        CHECK_OUT_FILE="$2"
        checkOut;;
    check)
        FILE_TO_CHECK="$2"
        checkFile;;
esac