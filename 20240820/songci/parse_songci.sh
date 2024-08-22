#!/bin/bash -x


# 1. 
cat ../all/*.txt | grep '·' | grep -v '首' > songci.txt

# 2. parse
./parse_cipai | sort -nr -k1 > songci_sort.txt

