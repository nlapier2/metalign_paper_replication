# goldstandard taxids are listed in same format as megan info file
python3 megan_to_cami_fmt.py --megan timing/results/goldstandard_taxids.txt --cami timing/results/goldstandard.tsv --SampleID peabody

python3 bracken_to_cami_fmt.py --bracken timing/results/bracken_results_fastq_version.txt --cami timing/results/cami_fmt_bracken_results_fastq_version.tsv --SampleID peabody

python3 clark_to_cami_fmt.py --clark timing/results/clark_abundances_fastq_version.txt --cami timing/results/cami_fmt_clark_abundances_fastq_version.tsv --SampleID peabody

python3 gottcha_to_cami_fmt.py --gottcha timing/results/fastq_version.gottcha.tsv --cami timing/results/cami_fmt_gottcha_abundances_fastq_version.tsv --SampleID peabody

python3 megan_to_cami_fmt.py --megan timing/results/peabody_fastq_version.info --cami timing/results/cami_fmt_megan_diamond_fastq_version.tsv --SampleID peabody

sed -i 's/_noname//g' timing/results/metaphlan2_results_fastq_version.txt
python2 CAMIMetaPhlAn/src/MetaPhlAn2CAMI.py --input timing/results/metaphlan2_results_fastq_version.txt --output timing/results/cami_fmt_metaphlan2_results_fastq_version.txt --taxonomy CAMIMetaPhlAn/out/taxonomy_reduced_taxID_.txt
sed -i 's/ \t /\t/g' timing/results/cami_fmt_metaphlan2_results_fastq_version.txt
sed -i 's/\t /\t/g' timing/results/cami_fmt_metaphlan2_results_fastq_version.txt
#
