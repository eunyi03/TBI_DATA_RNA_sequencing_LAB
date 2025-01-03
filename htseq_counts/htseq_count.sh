#!/bin/bash
# Define the number of CPUs to use
cpu=10

# Define the range of samples
for base in SRR5292042 SRR5292043 SRR5292044 SRR5292045
do
  echo "Processing $base"

  # Run HTSeq to generate count tables
  htseq-count -f bam -r pos -s no -t exon -i gene_id -n $cpu \
    /data1/project/eunyi/tbi/data/aligned/${base}Aligned.sortedByCoord.out.bam \
    /data1/project/eunyi/tbi/data/reference/mm9.refGene.gtf > /data1/project/eunyi/tbi/data/htseq_counts/${base}_counts.txt
  
  echo "Completed processing $base"
done
