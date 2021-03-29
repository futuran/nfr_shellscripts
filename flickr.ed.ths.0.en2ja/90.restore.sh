#!/bin/sh
size=$1

for rank in 1 2 3; do
    for file in ./$size.merge/$rank/*; do
        echo $file
        sed -r 's/(@@ )|(@@ ?$)//g' < $file > ${file}.r
    done
done
