# sdhash_data_analysis
A simple bash script that calculates the average sdhash scores across many disk image comparisons.

Usage: `./awk_process.sh dirs.txt all_sdhashes.txt`

Input arg #1 (e.g. `dirs.txt`) should be a text file listing directories where your disk images are located, one directory path per line.

Input arg #2 (e.g. `all_sdhashes.txt`) should be a text file containing any resulting output generated from previous runs of sdhash, with one comparison per line (e.g. `disk001/disk001A.img|disk001/disk001B.img|100`).

