cutoff=(no 0pt01 0pt1 1pt0 5pt0 10pt0)

for i in 0 1 2 3 4 5
do
	docker run -v /Users/nathanlapierre/Documents/ucla-research/metalign/OPAL/peabody_profiles/${cutoff[$i]}_cutoff:/host opal:latest opal.py -g /host/goldstandard.tsv /host/cutoff_0pt01_metalign_profile_fastq_version.tsv /host/cami_fmt_bracken_results_fastq_version.tsv /host/cami_fmt_clark_abundances_fastq_version.tsv /host/cami_fmt_gottcha_abundances_fastq_version.tsv /host/cami_fmt_megan_diamond_fastq_version.tsv /host/cami_fmt_metabing2_gpu_fasta_version.txt /host/cami_fmt_metaphlan2_results_fastq_version.txt /host/motus2_default_fastq_version.txt -l "Metalign, Bracken+Kraken2, CLARK, GOTTCHA, MEGAN+DIAMOND, MetaBinG2, MetaPhlAn2, mOTUs2" -o /host/opal_results/  --ranks superkingdom,species
done
