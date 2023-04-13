#!/bin/bash
GTF="/home/student/Master_Trainee/Naveen/NGS/Genomefiles/Bos_taurus.ARS-UCD1.2.99.gtf"
FNA="/home/student/Master_Trainee/Naveen/NGS/Genomefiles/Bos_taurus.ARS-UCD1.2.dna.toplevel.fa"
INDEX="/home/student/meta-analysis/cell1/rsem/star"
Read="/home/student/meta-analysis/cell2/sort"

#rsem-prepare-reference --gtf $GTF $FNA --star -p 8 $INDEX/stind

for i in $Read/*.mRNA.fastq.gz
do
Out=$(basename $R1|sed "s/.mRNA.fastq.gz//")


echo $R1 $Out

rsem-calculate-expression --star -p 8 $R1 $INDEX/stind $Out
done

