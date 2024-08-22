#!/bin/bash -x 

# 1. grep_gushi.sh

# 2. pase_all_shi read all_shi.txt group & output
./parse_all_shi  | sort -n -k1 -r > all_shi_sort.txt

