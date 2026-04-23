#! /bin/sh

# Check whether all the required arguments are provided to this script
if [ $# -ne 2 ]
then
	echo "Usage: ./finder.sh filesdir searchstr"
	echo "(1) filesdir - Path to a directory on the filesystem"
	echo "(2) searchstr - Text string which will be searched within the files in the above path"

	exit 1
fi

filesdir=$1
searchstr=$2

# Check whether the "filesdir" argument is a valid directory
if [ -d $filesdir ]
then
	filescount=$(grep -rc $searchstr $filesdir | grep -v ":0" | wc -l)
	wordscount=$(grep -r $searchstr $filesdir | wc -l)
	# grep -r $searchstr $filesdir
	
	echo "$filescount"
	echo "$wordscount"
	
	echo "The number of files are $filescount and the number of matching lines are $wordscount"

	exit 0
else
	echo "The directory """$filesdir""" is not a valid directory!"
	exit 1
fi
