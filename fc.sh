#!/bin/bash

GTF="/home/student/Master_Trainee/Naveen/NGS/Genomefiles/Bos_taurus.ARS-UCD1.2.99.gtf"

for i in SSRR*
do
echo $i
Out=$(basename $i|sed 's/.bam//')
echo $Out
featureCounts -T 20 -t exon -g gene_id -O -s 1 -M -a /home/student/Master_Trainee/Naveen/NGS/Genomefiles/Bos_taurus.ARS-UCD1.2.99.gtf -o $Out.txt $i

done


