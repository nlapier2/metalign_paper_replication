{ ~/bin/time -f "time result\ncmd:%C\nreal %es\nuser %Us \nsys  %Ss \nmemory:%MKB \ncpu %P" motus profile -C precision -s challenge_low/RL_S001__insert_270.fq -o timing/results/motus2_default_RL_S001.txt -t 4 ; } 2> timing/timing_motus2_RL_S001.txt

{ ~/bin/time -f "time result\ncmd:%C\nreal %es\nuser %Us \nsys  %Ss \nmemory:%MKB \ncpu %P" motus profile -C precision -s challenge_med/RM2_S001__insert_270.fq -o timing/results/motus2_default_RM2_S001.txt -t 4 ; } 2> timing/timing_motus2_RM2_S001.txt

{ ~/bin/time -f "time result\ncmd:%C\nreal %es\nuser %Us \nsys  %Ss \nmemory:%MKB \ncpu %P" motus profile -C precision -s challenge_med/RM2_S002__insert_270.fq -o timing/results/motus2_default_RM2_S002.txt -t 4 ; } 2> timing/timing_motus2_RM2_S002.txt

{ ~/bin/time -f "time result\ncmd:%C\nreal %es\nuser %Us \nsys  %Ss \nmemory:%MKB \ncpu %P" motus profile -C precision -s challenge_high/RH_S001__insert_270.fq -o timing/results/motus2_default_RH_S001.txt -t 4 ; } 2> timing/timing_motus2_RH_S001.txt

{ ~/bin/time -f "time result\ncmd:%C\nreal %es\nuser %Us \nsys  %Ss \nmemory:%MKB \ncpu %P" motus profile -C precision -s challenge_high/RH_S002__insert_270.fq -o timing/results/motus2_default_RH_S002.txt -t 4 ; } 2> timing/timing_motus2_RH_S002.txt

{ ~/bin/time -f "time result\ncmd:%C\nreal %es\nuser %Us \nsys  %Ss \nmemory:%MKB \ncpu %P" motus profile -C precision -s challenge_high/RH_S003__insert_270.fq -o timing/results/motus2_default_RH_S003.txt -t 4 ; } 2> timing/timing_motus2_RH_S003.txt

{ ~/bin/time -f "time result\ncmd:%C\nreal %es\nuser %Us \nsys  %Ss \nmemory:%MKB \ncpu %P" motus profile -C precision -s challenge_high/RH_S004__insert_270.fq -o timing/results/motus2_default_RH_S004.txt -t 4 ; } 2> timing/timing_motus2_RH_S004.txt

{ ~/bin/time -f "time result\ncmd:%C\nreal %es\nuser %Us \nsys  %Ss \nmemory:%MKB \ncpu %P" motus profile -C precision -s challenge_high/RH_S005__insert_270.fq -o timing/results/motus2_default_RH_S005.txt -t 4 ; } 2> timing/timing_motus2_RH_S005.txt

#

