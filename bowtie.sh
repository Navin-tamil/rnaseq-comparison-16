#!/bin/bash

Index="/home/student/meta-analysis/cell1/bowtie"
Input="/home/student/meta-analysis/cell2/sort"

for R1 in $Input/*.mRNA.fastq.gz

do 
Out=$(basename $R1|sed 's/.mRNA.fastq.gz//')
echo $R1 $Out
bowtie2 -p 15 -x $Index/bowtieindex -U $R1 -S $Out.sam
#samtools view -@ 15 -S -b $Out.sam > $Out.bam
done

