{ ~/bin/time -f "time result\ncmd:%C\nreal %es\nuser %Us \nsys  %Ss \nmemory:%MKB \ncpu %P" metalign.py challenge_low/RL_S001__insert_270.fq /local2/nlapier2/metalign/Metalign/data/ --threads 4 --output timing/results/metalign_RL_S001.tsv ; } 2> timing/timing_metalign_RL_S001.txt

{ ~/bin/time -f "time result\ncmd:%C\nreal %es\nuser %Us \nsys  %Ss \nmemory:%MKB \ncpu %P" metalign.py challenge_med/RM2_S001__insert_270.fq /local2/nlapier2/metalign/Metalign/data/ --threads 4 --output timing/results/metalign_RM2_S001.tsv ; } 2> timing/timing_metalign_RM2_S001.txt

{ ~/bin/time -f "time result\ncmd:%C\nreal %es\nuser %Us \nsys  %Ss \nmemory:%MKB \ncpu %P" metalign.py challenge_med/RM2_S002__insert_270.fq /local2/nlapier2/metalign/Metalign/data/ --threads 4 --output timing/results/metalign_RM2_S002.tsv ; } 2> timing/timing_metalign_RM2_S002.txt

{ ~/bin/time -f "time result\ncmd:%C\nreal %es\nuser %Us \nsys  %Ss \nmemory:%MKB \ncpu %P" metalign.py challenge_high/RH_S001__insert_270.fq /local2/nlapier2/metalign/Metalign/data/ --threads 4 --output timing/results/metalign_RH_S001.tsv ; } 2> timing/timing_metalign_RH_S001.txt

{ ~/bin/time -f "time result\ncmd:%C\nreal %es\nuser %Us \nsys  %Ss \nmemory:%MKB \ncpu %P" metalign.py challenge_high/RH_S002__insert_270.fq /local2/nlapier2/metalign/Metalign/data/ --threads 4 --output timing/results/metalign_RH_S002.tsv ; } 2> timing/timing_metalign_RH_S002.txt

{ ~/bin/time -f "time result\ncmd:%C\nreal %es\nuser %Us \nsys  %Ss \nmemory:%MKB \ncpu %P" metalign.py challenge_high/RH_S003__insert_270.fq /local2/nlapier2/metalign/Metalign/data/ --threads 4 --output timing/results/metalign_RH_S003.tsv ; } 2> timing/timing_metalign_RH_S003.txt

{ ~/bin/time -f "time result\ncmd:%C\nreal %es\nuser %Us \nsys  %Ss \nmemory:%MKB \ncpu %P" metalign.py challenge_high/RH_S004__insert_270.fq /local2/nlapier2/metalign/Metalign/data/ --threads 4 --output timing/results/metalign_RH_S004.tsv ; } 2> timing/timing_metalign_RH_S004.txt

{ ~/bin/time -f "time result\ncmd:%C\nreal %es\nuser %Us \nsys  %Ss \nmemory:%MKB \ncpu %P" metalign.py challenge_high/RH_S005__insert_270.fq /local2/nlapier2/metalign/Metalign/data/ --threads 4 --output timing/results/metalign_RH_S005.tsv ; } 2> timing/timing_metalign_RH_S005.txt
#
