#!/bin/sh

for file in $1/* ;do
    sed -r 's/(@@ )|(@@ ?$)//g' < $file > ${file}.r
done
