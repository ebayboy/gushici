#!/bin/bash -x 

# 1. cat  all/*.txt > all.txt


# 2. pase_all read all.txt group & output

# 3. sort -n -k1 -r > all_sort.txt
./parse_all  | sort -n -k1 -r > all_sort.txt

