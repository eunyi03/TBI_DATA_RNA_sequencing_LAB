#!/bin/bash
# Define the number of CPUs to use
cpu=10

# Define the range of samples
for base in SRR5292039 SRR5292040 SRR5292041 SRR5292042 SRR5292043 SRR5292044
do
  echo "Processing $base"

  # Run HTSeq to generate count tables
  htseq-count -f bam -r pos -s no -t exon -i gene_id -n $cpu \
    /data1/project/eunyi/tbi/data/bow_aligned/${base}.bam \
    /data1/project/eunyi/tbi/data/reference/mm9.ensGene.gtf > /data1/project/eunyi/tbi/data/bowht_counts/${base}_counts.txt
  
  echo "Completed processing $base"
done