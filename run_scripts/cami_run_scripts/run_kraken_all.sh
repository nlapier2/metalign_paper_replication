{ ~/bin/time -f "time result\ncmd:%C\nreal %es\nuser %Us \nsys  %Ss \nmemory:%MKB \ncpu %P" kraken2 --db /local2/nlapier2/metalign/tools/kraken2/full_database/ challenge_low/RL_S001__insert_270.fq --report timing/results/kraken2_report_RL_S001.txt --threads 4 > timing/results/stdout_kraken2_RL_S001.txt ; } 2> timing/timing_kraken2_RL_S001.txt

{ ~/bin/time -f "time result\ncmd:%C\nreal %es\nuser %Us \nsys  %Ss \nmemory:%MKB \ncpu %P" kraken2 --db /local2/nlapier2/metalign/tools/kraken2/full_database/ challenge_med/RM2_S001__insert_270.fq --report timing/results/kraken2_report_RM2_S001.txt --threads 4 > timing/results/stdout_kraken2_RM2_S001.txt ; } 2> timing/timing_kraken2_RM2_S001.txt

{ ~/bin/time -f "time result\ncmd:%C\nreal %es\nuser %Us \nsys  %Ss \nmemory:%MKB \ncpu %P" kraken2 --db /local2/nlapier2/metalign/tools/kraken2/full_database/ challenge_med/RM2_S002__insert_270.fq --report timing/results/kraken2_report_RM2_S002.txt --threads 4 > timing/results/stdout_kraken2_RM2_S002.txt ; } 2> timing/timing_kraken2_RM2_S002.txt

{ ~/bin/time -f "time result\ncmd:%C\nreal %es\nuser %Us \nsys  %Ss \nmemory:%MKB \ncpu %P" kraken2 --db /local2/nlapier2/metalign/tools/kraken2/full_database/ challenge_high/RH_S001__insert_270.fq --report timing/results/kraken2_report_RH_S001.txt --threads 4 > timing/results/stdout_kraken2_RH_S001.txt ; } 2> timing/timing_kraken2_RH_S001.txt

{ ~/bin/time -f "time result\ncmd:%C\nreal %es\nuser %Us \nsys  %Ss \nmemory:%MKB \ncpu %P" kraken2 --db /local2/nlapier2/metalign/tools/kraken2/full_database/ challenge_high/RH_S002__insert_270.fq --report timing/results/kraken2_report_RH_S002.txt --threads 4 > timing/results/stdout_kraken2_RH_S002.txt ; } 2> timing/timing_kraken2_RH_S002.txt

{ ~/bin/time -f "time result\ncmd:%C\nreal %es\nuser %Us \nsys  %Ss \nmemory:%MKB \ncpu %P" kraken2 --db /local2/nlapier2/metalign/tools/kraken2/full_database/ challenge_high/RH_S003__insert_270.fq --report timing/results/kraken2_report_RH_S003.txt --threads 4 > timing/results/stdout_kraken2_RH_S003.txt ; } 2> timing/timing_kraken2_RH_S003.txt

{ ~/bin/time -f "time result\ncmd:%C\nreal %es\nuser %Us \nsys  %Ss \nmemory:%MKB \ncpu %P" kraken2 --db /local2/nlapier2/metalign/tools/kraken2/full_database/ challenge_high/RH_S004__insert_270.fq --report timing/results/kraken2_report_RH_S004.txt --threads 4 > timing/results/stdout_kraken2_RH_S004.txt ; } 2> timing/timing_kraken2_RH_S004.txt

{ ~/bin/time -f "time result\ncmd:%C\nreal %es\nuser %Us \nsys  %Ss \nmemory:%MKB \ncpu %P" kraken2 --db /local2/nlapier2/metalign/tools/kraken2/full_database/ challenge_high/RH_S005__insert_270.fq --report timing/results/kraken2_report_RH_S005.txt --threads 4 > timing/results/stdout_kraken2_RH_S005.txt ; } 2> timing/timing_kraken2_RH_S005.txt

#
