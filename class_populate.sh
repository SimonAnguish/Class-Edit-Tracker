#!/bin/bash

diff_FILE="diff.csv"
file_name="curr_enroll_spring_$(date +'%m-%d-%Y').csv"

# Get the new file info
curl http://giraffe.uvm.edu/~rgweb/batch/curr_enroll_spring.csv > $file_name

# Check the differences between the old one and the new
diff <(sort curr_enroll_spring.csv) <(sort $file_name) > $diff_FILE

if [ -s $diff_FILE ] ; then
	echo "-- $diff_FILE has data"
	
	# Archive the other file
	if [ ! -d "archives" ] ; then
		mkdir "archives"
	fi ;
	
	mv "curr_enroll_spring.csv" "archives/archived_$(date +'%m-%d-%Y')"
	
	# Replace the curr_enroll_spring with the new file
	mv $file_name "curr_enroll_spring.csv"
else
	echo "-- $diff_FILE has no new data"
	rm $file_name
fi ;