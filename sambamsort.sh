#!/bin/bash

for i in *.sam

do 
Out=$(basename $i|sed 's/.sam//')
samtools view -S -b $i > $Out.bam
samtools sort -@ 15 -n $Out.bam >S$Out.bam
done

