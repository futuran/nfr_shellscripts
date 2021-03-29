tr=../flickr.tkn.bpe/flickr_train.en1.tokenized.bpe
vl=../flickr.tkn.bpe/flickr_val.en1.tokenized.bpe
ts=../flickr.tkn.bpe/flickr_test.en1.tokenized.bpe

mkdir match
python ./z.build_nfr_dataset.py -q $tr -tms $tr --output ./match/train.match -sss_lambda 0.0 --ed_lambda 0.0
python ./z.build_nfr_dataset.py -q $vl -tms $tr --output ./match/val.match -sss_lambda 0.0 --ed_lambda 0.0
python ./z.build_nfr_dataset.py -q $ts -tms $tr --output ./match/test.match -sss_lambda 0.0 --ed_lambda 0.0 --include-perfect-match

