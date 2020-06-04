lmh=(L M2 M2 H H H H H)
lowmedhigh=(low medium medium high high high high high)
s00=(1 1 2 1 2 3 4 5)

for i in 0 1 2 3 4 5 6 7
do
	docker run -v /Users/nathanlapierre/Documents/ucla-research/metalign/OPAL/custom_kraken2_profiles/R${lmh[$i]}_S00${s00[$i]}:/host opal:latest opal.py -g /host/goldstandard_${lowmedhigh[$i]}_${s00[$i]}.profile /host/metalign_R${lmh[$i]}_S00${s00[$i]}.tsv /host/opal_fmt_bracken_results_R${lmh[$i]}_S00${s00[$i]}.txt /host/orig_db_opal_fmt_bracken_results_R${lmh[$i]}_S00${s00[$i]}.txt -l "Metalign, Bracken_custom, Bracken_original" -o /host/opal_results/  --ranks superkingdom,species
	docker run -v /Users/nathanlapierre/Documents/ucla-research/metalign/OPAL/custom_kraken2_profiles/thresh_0pt1pct_R${lmh[$i]}_S00${s00[$i]}:/host opal:latest opal.py -g /host/goldstandard_${lowmedhigh[$i]}_${s00[$i]}.profile /host/metalign_R${lmh[$i]}_S00${s00[$i]}.tsv /host/opal_fmt_bracken_results_R${lmh[$i]}_S00${s00[$i]}.txt /host/orig_db_opal_fmt_bracken_results_R${lmh[$i]}_S00${s00[$i]}.txt -l "Metalign, Bracken_custom, Bracken_original" -o /host/opal_results/  --ranks superkingdom,species
	docker run -v /Users/nathanlapierre/Documents/ucla-research/metalign/OPAL/custom_kraken2_profiles/thresh_0pt01pct_R${lmh[$i]}_S00${s00[$i]}:/host opal:latest opal.py -g /host/goldstandard_${lowmedhigh[$i]}_${s00[$i]}.profile /host/metalign_R${lmh[$i]}_S00${s00[$i]}.tsv /host/opal_fmt_bracken_results_R${lmh[$i]}_S00${s00[$i]}.txt /host/orig_db_opal_fmt_bracken_results_R${lmh[$i]}_S00${s00[$i]}.txt -l "Metalign, Bracken_custom, Bracken_original" -o /host/opal_results/  --ranks superkingdom,species
done
