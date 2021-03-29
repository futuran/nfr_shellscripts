for tvt in train valid test; do
    sed "s/@@@ /|/g" ./$1/${tvt}.with_match.en | cut -d "|" -f1  > ./$1/${tvt}.with_match.enonly
    sed "s/@@@ /|/g" ./$1/${tvt}.with_match.fr | cut -d "|" -f2  > ./$1/${tvt}.with_match.simonly
done
