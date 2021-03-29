for rank in 1 2 3; do
    for file in ./merge/$rank/*; do
        echo $file
        sed -r 's/(@@ )|(@@ ?$)//g' < $file > ${file}.r
    done
done
