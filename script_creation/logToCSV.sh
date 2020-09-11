#!/usr/bin/env bash
# This program should take an fileIn as first parameter
# It takes the input log file that has the same format as access_log and maps it to a csv format
# the csv format is:
# Client,Time,Type,Path,Status,Size
#
# The program should not create a csv file.
# This can be done by piping the output to a file.
# example: './logToCSV access_log > output.csv'
# It could take some time to convert all of access_log. Consider using a small subset for testing.

accessData=$(cat $1 |awk -F " " 'BEGIN{s=","} {print $1, s, $4, s, $6, s, $7 s, $9, s, $10;}' | tr -d '[' | tr -d '"' | sed -r "s: , :,:g" | sed -r "s:, :,:g" )
# Print accessData
echo "Client,Time,Type,Path,Status,Size"
echo "$accessData"