#!/bin/bash
INDEX="/home/student/meta-analysis/cell1/rsem"
Read="/home/student/meta-analysis/cell2/sort"
for R1 in $Read/*.mRNA.fastq.gz
do
Out=$(basename $R1|sed "s/.mRNA.fastq.gz//")


echo $R1 $Out

rsem-calculate-expression --forward-prob 1 -p 8 --bowtie2 $R1 $INDEX/bind $Out 
done

