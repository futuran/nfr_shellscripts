SCRDIR=../NFR_scripts/neural_match/sbert_by_faiss

# 1 cal embs
mkdir emb
for prefix in train val test; do
    python ${SCRDIR}/1.embed.py -s ../flickr.tkn.bpe/flickr_$prefix.en1.tokenized.bpe \
                                -t ../flickr.tkn.bpe/flickr_$prefix.ja1.tokenized.bpe \
                                -so ./emb/${prefix}.en.emb \
                                -to ./emb/${prefix}.ja.emb \
                                --model-dir 'distiluse-base-multilingual-cased-v2' \
                                --remove-bpe-in-corpus \
                                --normalize-vectors
    wait
done

