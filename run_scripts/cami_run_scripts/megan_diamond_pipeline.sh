# USAGE: ./megan_diamond_pipeline.sh <input_reads_R1> <input_reads_R2> <diamond_db_file> <megan_map_file> <output_results_filename>
# EXAMPLE: ./megan_diamond_pipeline.sh /local2/nlapier2/metalign/test/1cami_low1_10k_reads.fq.R1 /local2/nlapier2/metalign/test/1cami_low1_10k_reads.fq.R2 /local2/nlapier2/metalign/tools/MEGAN6/nr /local2/nlapier2/metalign/tools/MEGAN6/megan-map-Oct2019.db /local2/nlapier2/metalign/test/megan_diamond_test_results.txt
diamond blastx --query $1 --db $3 --daa TEMP_DAA_R1.daa --threads 4  # run diamond
diamond blastx --query $2 --db $3 --daa TEMP_DAA_R2.daa --threads 4
daa2rma -i TEMP_DAA_R1.daa TEMP_DAA_R2.daa -o TEMP_RMA.rma -mdb $4 -p  # convert to megan rma format
rma2info -i TEMP_RMA.rma -c2c Taxonomy > $5  # convert to read counts per TaxID
#
