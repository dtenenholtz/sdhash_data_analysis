#!/bin/bash
# calculate average of the sdhash results for each disk
# requires previous running of sdhash with generated output saved to a file
# usage in command line: ./awk_process.sh dirs.txt all_sdhashes.txt

# Input arg 1 'dirs.txt' is a list of directory names from a file, should look like...
# disk001
# disk002
# disk003
# etc

dir=$1

# Input arg 2 'all_sdhashes.txt' is a file 'all_sdhashes.txt' containing all sdhash comparisons in a long list
# Each row in 'all_sdhashes.txt' looks like...
# diskimagepath/disk001A.img|diskimagepath/disk001B.img|100
# Fields are delimited by a '|'.
# The third column in each row is the sdhash score for that comparison.

sdh=$2

# Loop over the list of directory names corresponding to disk captures,
# i.e. disk001/disk001A.img, disk001/disk001B.img, disk001/disk001C.img, etc
# Calculate averages of sdhash scores.
# Results closer to 100 mean more similar capture (better quality, less variation across capturing attempts)

while IFS='' read line
do
# for rows matching directory name pattern 'pat', calc the avg of values in col 3
# field separator is set to '|'

awk -v pat="$line" -F '|' '$1~pat {
sum += $3 ; n++
}

END {
if (n > 0) print pat, sum / n
}' "$sdh"
done < $dir
