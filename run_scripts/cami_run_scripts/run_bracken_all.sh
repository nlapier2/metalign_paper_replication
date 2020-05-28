#!/bin/bash
fnames=( RL_S001 RM2_S001 RM2_S002 RH_S001 RH_S002 RH_S003 RH_S004 RH_S005 )
for i in "${fnames[@]}"
do
	/local2/nlapier2/metalign/tools/Bracken/bracken -d /local2/nlapier2/metalign/tools/kraken2/full_database/ -i timing/results/kraken2_report_$i.txt -o timing/results/bracken_domain_level_$i.txt -l D
	/local2/nlapier2/metalign/tools/Bracken/bracken -d /local2/nlapier2/metalign/tools/kraken2/full_database/ -i timing/results/kraken2_report_$i.txt -o timing/results/bracken_phylum_level_$i.txt -l P
	/local2/nlapier2/metalign/tools/Bracken/bracken -d /local2/nlapier2/metalign/tools/kraken2/full_database/ -i timing/results/kraken2_report_$i.txt -o timing/results/bracken_class_level_$i.txt -l C
	/local2/nlapier2/metalign/tools/Bracken/bracken -d /local2/nlapier2/metalign/tools/kraken2/full_database/ -i timing/results/kraken2_report_$i.txt -o timing/results/bracken_order_level_$i.txt -l O
	/local2/nlapier2/metalign/tools/Bracken/bracken -d /local2/nlapier2/metalign/tools/kraken2/full_database/ -i timing/results/kraken2_report_$i.txt -o timing/results/bracken_family_level_$i.txt -l F
	/local2/nlapier2/metalign/tools/Bracken/bracken -d /local2/nlapier2/metalign/tools/kraken2/full_database/ -i timing/results/kraken2_report_$i.txt -o timing/results/bracken_genus_level_$i.txt -l G
	/local2/nlapier2/metalign/tools/Bracken/bracken -d /local2/nlapier2/metalign/tools/kraken2/full_database/ -i timing/results/kraken2_report_$i.txt -o timing/results/bracken_species_level_$i.txt -l S
	cat timing/results/bracken_domain_level_$i.txt timing/results/bracken_phylum_level_$i.txt timing/results/bracken_class_level_$i.txt timing/results/bracken_order_level_$i.txt timing/results/bracken_family_level_$i.txt timing/results/bracken_genus_level_$i.txt timing/results/bracken_species_level_$i.txt > timing/results/bracken_results_$i.txt
	rm timing/results/bracken_domain_level_$i.txt timing/results/bracken_phylum_level_$i.txt timing/results/bracken_class_level_$i.txt timing/results/bracken_order_level_$i.txt timing/results/bracken_family_level_$i.txt timing/results/bracken_genus_level_$i.txt timing/results/bracken_species_level_$i.txt
done
#
