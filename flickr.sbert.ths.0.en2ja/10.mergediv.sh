for prefix in train val test; do
    for rank in 1 2 3; do
        sed 's/ ||| /|/g' ./match/$prefix.match | sed 's/$/|/g' | cut -d "|" -f$rank > ./match/$prefix.match.$rank
    done
done
