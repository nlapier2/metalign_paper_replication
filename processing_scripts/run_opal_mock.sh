cutoff=(no 0pt01 0pt1 1pt0 5pt0 10pt0)

for i in 0 1 2 3 4 5
do
	docker run -v /Users/nathanlapierre/Documents/ucla-research/metalign/OPAL/peabody_profiles/${cutoff[$i]}_cutoff:/host opal:latest opal.py -g /host/goldstandard.tsv /host/cutoff_0pt01_metalign_profile_fastq_version.tsv /host/cami_fmt_bracken_results_fastq_version.tsv /host/cami_fmt_clark_abundances_fastq_version.tsv /host/cami_fmt_gottcha_abundances_fastq_version.tsv /host/cami_fmt_megan_diamond_fastq_version.tsv /host/cami_fmt_metaphlan2_results_fastq_version.txt /host/motus2_default_fastq_version.txt -l "Metalign, Bracken+Kraken2, CLARK, GOTTCHA, MEGAN+DIAMOND, MetaPhlAn2, mOTUs2" -o /host/opal_results/  --ranks superkingdom,species
	docker run -v /Users/nathanlapierre/Documents/ucla-research/metalign/OPAL/hmp_profiles/${cutoff[$i]}_cutoff:/host opal:latest opal.py -g /host/goldstandard.tsv /host/cutoff_0pt01_metalign_profile_SRR172902.3.tsv /host/cami_fmt_bracken_results_SRR172902.3.tsv /host/cami_fmt_clark_abundances_SRR172902.3.tsv /host/cami_fmt_gottcha_abundances_SRR172902.tsv /host/cami_fmt_megan_diamond_peabody_SRR172902.3.tsv /host/cami_fmt_metaphlan2_results_SRR172902.3.tsv /host/motus2_default_SRR172902.3.txt -l "Metalign, Bracken+Kraken2, CLARK, GOTTCHA, MEGAN+DIAMOND, MetaPhlAn2, mOTUs2" -o /host/opal_results/  --ranks superkingdom,species
done
