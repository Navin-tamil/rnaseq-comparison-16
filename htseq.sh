#!/bin/bash

GTF="/home/student/Master_Trainee/Naveen/NGS/Genomefiles/Bos_taurus.ARS-UCD1.2.99.gtf"

for i in SSR*.bam
do
Out=$(echo $i|sed 's/.bam//')
echo $i $Out
#htseq-count $i $GTF -f bam -m union >htseq_u_$Out.txt
#htseq-count $i $GTF -f bam -m intersection-nonempty >htseq_n_$Out.txt
#htseq-count $i $GTF -f bam -m intersection-strict >htseq_s_$Out.txt
done

