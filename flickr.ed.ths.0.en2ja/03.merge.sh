SCRDIR=../NFR_scripts/neural_match/sbert_by_faiss

# 3 merge
mkdir merge
for prefix in train val; do
    python ${SCRDIR}/3.merge.py \
        -s ../flickr.tkn.bpe/flickr_$prefix.en1.tokenized.bpe \
        -t ../flickr.tkn.bpe/flickr_$prefix.ja1.tokenized.bpe \
        --match-file ./match/${prefix}.match \
        -tmt ../flickr.tkn.bpe/flickr_train.ja1.tokenized.bpe \
        -o ./merge/ \
        --topk 1 --threshold 0.00
    wait
done

for rank in 1 2 3; do
    mkdir ./merge/$rank/
    python ${SCRDIR}/3.merge.py \
        -s ../flickr.tkn.bpe/flickr_test.en1.tokenized.bpe \
        -t ../flickr.tkn.bpe/flickr_test.ja1.tokenized.bpe \
        --match-file ./match/test.match.$rank \
        -tmt ../flickr.tkn.bpe/flickr_train.ja1.tokenized.bpe \
        -o ./merge/$rank/ \
        --topk 1 --threshold 0.00
        wait
done
