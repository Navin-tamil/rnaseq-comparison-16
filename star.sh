#!/bin/bash
GTF="/home/student/Master_Trainee/Naveen/NGS/Genomefiles/Bos_taurus.ARS-UCD1.2.99.gtf"
FNA="/home/student/Master_Trainee/Naveen/NGS/Genomefiles/Bos_taurus.ARS-UCD1.2.dna.toplevel.fa"
Read="/home/student/meta-analysis/cell2/sort"
File="/home/student/meta-analysis/cell1/star"
#1.Indexing
echo "Indexing Start"
#STAR --runMode genomeGenerate --runThreadN 15 --sjdbGTFfile $GTF --genomeDir /home/student/meta-analysis/cell1/star --genomeFastaFiles $FNA --genomeSAindexNbases 9
#2.Mapping
echo "Mapping start"
for R1 in $Read/*.mRNA.fastq.gz
do
Out=$(basename $R1|sed "s/.mRNA.fastq.gz//")
echo $Out $R1
STAR --runMode alignReads --genomeDir /home/student/meta-analysis/cell1/star --sjdbGTFfeatureExon $GTF --readFilesIn $R1 --readFilesCommand zcat --outSAMtype BAM SortedByCoordinate --outFilterMultimapNmax 20 --runThreadN 15 --outFileNamePrefix $Out --sjdbOverhang 100 --twopassMode Basic --quantMode TranscriptomeSAM
done

