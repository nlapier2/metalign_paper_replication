/local2/nlapier2/metalign/tools/CLARKSCV1.2.6.1/set_targets.sh /local2/nlapier2/metalign/tools/CLARKSCV1.2.6.1/FULL_DB bacteria viruses plasmid plastid protozoa fungi human

{ ~/bin/time -f "time result\ncmd:%C\nreal %es\nuser %Us \nsys  %Ss \nmemory:%MKB \ncpu %P" /local2/nlapier2/metalign/tools/CLARKSCV1.2.6.1/classify_metagenome.sh -n 4 -O challenge_low/RL_S001__insert_270.fq -R timing/results/clark_assignments_RL_S001.csv ; } 2> timing/timing_clark_RL_S001.txt

/local2/nlapier2/metalign/tools/CLARKSCV1.2.6.1/estimate_abundance.sh -F timing/results/clark_assignments_RL_S001.csv.csv > timing/results/clark_abundances_RL_S001.txt

{ ~/bin/time -f "time result\ncmd:%C\nreal %es\nuser %Us \nsys  %Ss \nmemory:%MKB \ncpu %P" /local2/nlapier2/metalign/tools/CLARKSCV1.2.6.1/classify_metagenome.sh -n 4 -O challenge_med/RM2_S001__insert_270.fq -R timing/results/clark_assignments_RM2_S001.csv ; } 2> timing/timing_clark_RM2_S001.txt

/local2/nlapier2/metalign/tools/CLARKSCV1.2.6.1/estimate_abundance.sh -F timing/results/clark_assignments_RM2_S001.csv.csv > timing/results/clark_abundances_RM2_S001.txt

{ ~/bin/time -f "time result\ncmd:%C\nreal %es\nuser %Us \nsys  %Ss \nmemory:%MKB \ncpu %P" /local2/nlapier2/metalign/tools/CLARKSCV1.2.6.1/classify_metagenome.sh -n 4 -O challenge_med/RM2_S002__insert_270.fq -R timing/results/clark_assignments_RM2_S002.csv ; } 2> timing/timing_clark_RM2_S002.txt

/local2/nlapier2/metalign/tools/CLARKSCV1.2.6.1/estimate_abundance.sh -F timing/results/clark_assignments_RM2_S002.csv.csv > timing/results/clark_abundances_RM2_S002.txt

{ ~/bin/time -f "time result\ncmd:%C\nreal %es\nuser %Us \nsys  %Ss \nmemory:%MKB \ncpu %P" /local2/nlapier2/metalign/tools/CLARKSCV1.2.6.1/classify_metagenome.sh -n 4 -O challenge_high/RH_S001__insert_270.fq -R timing/results/clark_assignments_RH_S001.csv ; } 2> timing/timing_clark_RH_S001.txt

/local2/nlapier2/metalign/tools/CLARKSCV1.2.6.1/estimate_abundance.sh -F timing/results/clark_assignments_RH_S001.csv.csv > timing/results/clark_abundances_RH_S001.txt

{ ~/bin/time -f "time result\ncmd:%C\nreal %es\nuser %Us \nsys  %Ss \nmemory:%MKB \ncpu %P" /local2/nlapier2/metalign/tools/CLARKSCV1.2.6.1/classify_metagenome.sh -n 4 -O challenge_high/RH_S002__insert_270.fq -R timing/results/clark_assignments_RH_S002.csv ; } 2> timing/timing_clark_RH_S002.txt

/local2/nlapier2/metalign/tools/CLARKSCV1.2.6.1/estimate_abundance.sh -F timing/results/clark_assignments_RH_S002.csv.csv > timing/results/clark_abundances_RH_S002.txt

{ ~/bin/time -f "time result\ncmd:%C\nreal %es\nuser %Us \nsys  %Ss \nmemory:%MKB \ncpu %P" /local2/nlapier2/metalign/tools/CLARKSCV1.2.6.1/classify_metagenome.sh -n 4 -O challenge_high/RH_S003__insert_270.fq -R timing/results/clark_assignments_RH_S003.csv ; } 2> timing/timing_clark_RH_S003.txt

/local2/nlapier2/metalign/tools/CLARKSCV1.2.6.1/estimate_abundance.sh -F timing/results/clark_assignments_RH_S003.csv.csv > timing/results/clark_abundances_RH_S003.txt

{ ~/bin/time -f "time result\ncmd:%C\nreal %es\nuser %Us \nsys  %Ss \nmemory:%MKB \ncpu %P" /local2/nlapier2/metalign/tools/CLARKSCV1.2.6.1/classify_metagenome.sh -n 4 -O challenge_high/RH_S004__insert_270.fq -R timing/results/clark_assignments_RH_S004.csv ; } 2> timing/timing_clark_RH_S004.txt

/local2/nlapier2/metalign/tools/CLARKSCV1.2.6.1/estimate_abundance.sh -F timing/results/clark_assignments_RH_S004.csv.csv > timing/results/clark_abundances_RH_S004.txt

{ ~/bin/time -f "time result\ncmd:%C\nreal %es\nuser %Us \nsys  %Ss \nmemory:%MKB \ncpu %P" /local2/nlapier2/metalign/tools/CLARKSCV1.2.6.1/classify_metagenome.sh -n 4 -O challenge_high/RH_S005__insert_270.fq -R timing/results/clark_assignments_RH_S005.csv ; } 2> timing/timing_clark_RH_S005.txt

/local2/nlapier2/metalign/tools/CLARKSCV1.2.6.1/estimate_abundance.sh -F timing/results/clark_assignments_RH_S005.csv.csv > timing/results/clark_abundances_RH_S005.txt
#
