#!/bin/sh
# Tester script for assignment 1 and assignment 2
# Author: Garry Hensen
filesdir="/tmp/nonameflder"
searchstr="defnonamestring"
#	echo "number of arguments passed, $#"
if [ $# -lt 2 ]
then
	echo "Incorrect number of arguments passed, missing Search string, $searchstr"
	if [ $# -lt 1 ]
	then
                echo "missing folder name, $filesdir"
	else
		filesdir=$1	 
	        echo "folder name, $filesdir"
        fi
        exit 1
else
        if [ -d $1 ]
	then
		filesdir=$1	 
		searchstr=$2
		#echo "folder dir:$filesdir, Search string:$searchstr"
        else
		echo "$1 is not a directory, hence can't search:$searchstr"
		exit 1	
        fi
	numfiles=$(find $filesdir -type f | wc -l)
	searchcnt=$(grep -oR "$searchstr" $filesdir | wc -l)
        echo "The number of files are $numfiles and the number of matching lines are $searchcnt"	
        exit 0
fi
