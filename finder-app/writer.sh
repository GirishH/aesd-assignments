#!/bin/sh
# Tester script for assignment 1 and assignment 2
# Author: Garry Hensen
writefile="/tmp/nonamefile"
writestr="defnowritestring"
#echo "number of arguments passed, $#"
# First check whether right number arguments are passed in or not!
if [ $# -lt 2 ]
then
	echo "Incorrect number of arguments passed, missing write string, $writestr"
	if [ $# -lt 1 ]
	then
                echo "missing write file name $writefile"
	else
		writefile=$1	 
	        echo "write-file name, $writefile"
        fi
        exit 1
else
# Next Check whether the write file is a directory or a file containing a directory that needs to be created 
# first..
	writefile=$1	 
	writestr=$2	 
set +e
	$(touch $writefile > /dev/null 2>&1)
        if [ $? -eq 0 ]; then
		#echo "given file :$writefile exists"
		$(echo  $writestr > $writefile)
        	exit 0
        else
		#echo "$1 contains a directory, hence need to create it first, writestr:$writestr"
		basedir=$(dirname $writefile)
		basefile=$(basename $writefile)
		mkdir -p $basedir     
        	if [ $? -eq 1 ]; then
 			echo "directory creation $basedir failed!!"
			exit 1
        	fi
		$(echo  $writestr > $writefile)
		#$(echo  $writestr > $basedir/$basefile)
        	exit 0
        fi
fi
