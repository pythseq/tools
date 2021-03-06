#!/bin/bash

##########################

# sort.sh
# May 2018
# Jake Reske
# Michigan State University
# reskejak@msu.edu
# https://github.com/reskejak

# sort each row of integers horizontally by increasing value
# usage: bash sort.sh coords.bed > coords.sorted.bed

# example application: consolidating genomic coordinates of forward and reverse reads (firstly requires read sorting)
# specific application: converting standard BEDPE files to minimal format for macs2
# source: https://www.unix.com/shell-programming-and-scripting/180835-sort-each-row-horizontally-awk-any.html

############################

while read line; do
      ary=(${line})
      for((i=0; i!=${#ary[@]}; ++i)); do
         for((j=i+1; j!=${#ary[@]}; ++j)); do
              if (( ary[i] > ary[j] )); then
                    ((key=ary[i]))
                    ((ary[i]=ary[j]))
                    ((ary[j]=key))
              fi
         done
      done
      echo ${ary[@]}
done < ${1}
