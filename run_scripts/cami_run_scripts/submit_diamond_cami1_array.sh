#!/bin/sh
#$ -S /bin/bash
#$ -N job-diamond_cami1_nlapier2
#$ -cwd
#$ -o stdout-diamond_cami1.out
#$ -l h_data=64G,highp,exclusive,h_rt=168:00:00
#$ -t 1-16:1

. /u/local/Modules/default/init/modules.sh
source ~/.bash_profile

i=$SGE_TASK_ID-1
lowmedhigh=(low low med med med med high high high high high high high high high high)
lmh=(L L M2 M2 M2 M2 H H H H H H H H H H)
s00=(S001 S001 S001 S001 S002 S002 S001 S001 S002 S002 S003 S003 S004 S004 S005 S005)
r1r2=(R1 R2 R1 R2 R1 R2 R1 R2 R1 R2 R1 R2 R1 R2 R1 R2)


{ /usr/bin/time -f "time result\ncmd:%C\nreal %es\nuser %Us \nsys  %Ss \nmemory:%MKB \ncpu %P" ./MEGAN6/diamond blastx --threads 4 --query challenge_${lowmedhigh[$i]}/R${lmh[$i]}_${s00[$i]}__insert_270.fq.${r1r2[$i]} --db MEGAN6/nr --daa timing/results/R${lmh[$i]}_${s00[$i]}__insert_270.fq.${r1r2[$i]}.daa; } 2> timing/timing_megan_diamond_R${lmh[$i]}_${s00[$i]}_${r1r2[$i]}.txt


#{ /usr/bin/time -f "time result\ncmd:%C\nreal %es\nuser %Us \nsys  %Ss \nmemory:%MKB \ncpu %P" ./MEGAN6/diamond blastx --threads 4 --query challenge_low/RL_S001__insert_270.fq.R1 --db MEGAN6/nr --daa timing/results/RL_S001__insert_270.fq.R1.daa; } 2> timing/timing_megan_diamond_RL_S001_R1.txt
#
