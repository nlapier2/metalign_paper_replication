# Based on the repo CAMIMetaPhlAn by David Koslicki. Thanks, David!
# To run this script, you must have cloned that repo into this directory:
# git clone https://github.com/dkoslicki/CAMIMetaPhlAn.git
# Please also follow the instructions in the repo's README to build the taxonomy
# Expected runtime is a few minutes

sed -i 's/_noname//g' timing/results/metaphlan2_results_RL_S001.txt
python2 CAMIMetaPhlAn/src/MetaPhlAn2CAMI.py --input timing/results/metaphlan2_results_RL_S001.txt --output timing/results/opal_fmt_metaphlan2_results_RL_S001.txt --taxonomy CAMIMetaPhlAn/out/taxonomy_reduced_taxID_.txt
sed -i 's/ \t /\t/g' timing/results/opal_fmt_metaphlan2_results_RL_S001.txt
sed -i 's/\t /\t/g' timing/results/opal_fmt_metaphlan2_results_RL_S001.txt

sed -i 's/_noname//g' timing/results/metaphlan2_results_RM2_S001.txt
python2 CAMIMetaPhlAn/src/MetaPhlAn2CAMI.py --input timing/results/metaphlan2_results_RM2_S001.txt --output timing/results/opal_fmt_metaphlan2_results_RM2_S001.txt --taxonomy CAMIMetaPhlAn/out/taxonomy_reduced_taxID_.txt
sed -i 's/ \t /\t/g' timing/results/opal_fmt_metaphlan2_results_RM2_S001.txt
sed -i 's/\t /\t/g' timing/results/opal_fmt_metaphlan2_results_RM2_S001.txt

sed -i 's/_noname//g' timing/results/metaphlan2_results_RM2_S002.txt
python2 CAMIMetaPhlAn/src/MetaPhlAn2CAMI.py --input timing/results/metaphlan2_results_RM2_S002.txt --output timing/results/opal_fmt_metaphlan2_results_RM2_S002.txt --taxonomy CAMIMetaPhlAn/out/taxonomy_reduced_taxID_.txt
sed -i 's/ \t /\t/g' timing/results/opal_fmt_metaphlan2_results_RM2_S002.txt
sed -i 's/\t /\t/g' timing/results/opal_fmt_metaphlan2_results_RM2_S002.txt

sed -i 's/_noname//g' timing/results/metaphlan2_results_RH_S001.txt
python2 CAMIMetaPhlAn/src/MetaPhlAn2CAMI.py --input timing/results/metaphlan2_results_RH_S001.txt --output timing/results/opal_fmt_metaphlan2_results_RH_S001.txt --taxonomy CAMIMetaPhlAn/out/taxonomy_reduced_taxID_.txt
sed -i 's/ \t /\t/g' timing/results/opal_fmt_metaphlan2_results_RH_S001.txt
sed -i 's/\t /\t/g' timing/results/opal_fmt_metaphlan2_results_RH_S001.txt

sed -i 's/_noname//g' timing/results/metaphlan2_results_RH_S002.txt
python2 CAMIMetaPhlAn/src/MetaPhlAn2CAMI.py --input timing/results/metaphlan2_results_RH_S002.txt --output timing/results/opal_fmt_metaphlan2_results_RH_S002.txt --taxonomy CAMIMetaPhlAn/out/taxonomy_reduced_taxID_.txt
sed -i 's/ \t /\t/g' timing/results/opal_fmt_metaphlan2_results_RH_S002.txt
sed -i 's/\t /\t/g' timing/results/opal_fmt_metaphlan2_results_RH_S002.txt

sed -i 's/_noname//g' timing/results/metaphlan2_results_RH_S003.txt
python2 CAMIMetaPhlAn/src/MetaPhlAn2CAMI.py --input timing/results/metaphlan2_results_RH_S003.txt --output timing/results/opal_fmt_metaphlan2_results_RH_S003.txt --taxonomy CAMIMetaPhlAn/out/taxonomy_reduced_taxID_.txt
sed -i 's/ \t /\t/g' timing/results/opal_fmt_metaphlan2_results_RH_S003.txt
sed -i 's/\t /\t/g' timing/results/opal_fmt_metaphlan2_results_RH_S003.txt

sed -i 's/_noname//g' timing/results/metaphlan2_results_RH_S004.txt
python2 CAMIMetaPhlAn/src/MetaPhlAn2CAMI.py --input timing/results/metaphlan2_results_RH_S004.txt --output timing/results/opal_fmt_metaphlan2_results_RH_S004.txt --taxonomy CAMIMetaPhlAn/out/taxonomy_reduced_taxID_.txt
sed -i 's/ \t /\t/g' timing/results/opal_fmt_metaphlan2_results_RH_S004.txt
sed -i 's/\t /\t/g' timing/results/opal_fmt_metaphlan2_results_RH_S004.txt

sed -i 's/_noname//g' timing/results/metaphlan2_results_RH_S005.txt
python2 CAMIMetaPhlAn/src/MetaPhlAn2CAMI.py --input timing/results/metaphlan2_results_RH_S005.txt --output timing/results/opal_fmt_metaphlan2_results_RH_S005.txt --taxonomy CAMIMetaPhlAn/out/taxonomy_reduced_taxID_.txt
sed -i 's/ \t /\t/g' timing/results/opal_fmt_metaphlan2_results_RH_S005.txt
sed -i 's/\t /\t/g' timing/results/opal_fmt_metaphlan2_results_RH_S005.txt
#
