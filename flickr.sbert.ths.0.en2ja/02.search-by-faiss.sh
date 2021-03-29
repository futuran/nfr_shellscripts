SCRDIR=../NFR_scripts/neural_match/sbert_by_faiss

mkdir match
# 2 search by faiss
for prefix in train val test; do

    if [ $prefix = 'test' ]; then
        PM='--include-perfect-match'
    else
        PM=''
    fi

    python ${SCRDIR}/2.search_by_faiss.py \
        -q ./emb/${prefix}.en.emb \
        -qt ../flickr.tkn.bpe/flickr_$prefix.en1.tokenized.bpe \
        -tms ./emb/train.en.emb \
        -tmst ../flickr.tkn.bpe/flickr_train.en1.tokenized.bpe \
        -tmt ./emb/train.ja.emb \
        -o ./match/${prefix}.match \
        -k 10 -d 512 $PM
    wait
done

