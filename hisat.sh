#!/bin/bash
FNA="/home/student/Master_Trainee/Naveen/NGS/Genomefiles/Bos_taurus.ARS-UCD1.2.dna.toplevel.fa"
Index="/home/student/Naveenprasath/cell/PRJNA591729/hisat"
Input="/home/student/meta-analysis/cell2/sort"

echo "indexing start"
#hisat2-build -p 30 $FNA $Index/hisat 


echo "Mapping start"

for R1 in $Input/*.mRNA.fastq.gz
do
Out=$(basename $R1|sed 's/.mRNA.fastq.gz//')
echo $Out $R1 
hisat2 -p 8 --dta -x ~/Naveenprasath/PRJNA778892/hisat/hisatindex/index -U $R1 -S $Out.sam
done

