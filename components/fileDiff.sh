#!/bin/bash

#This will be used for file manipulation.

echo "This is ${0}"

file1= $1;
file2= $2;

diff -c --report-identical-files file1 file2
