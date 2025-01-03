#!/bin/bash
# Define the number of CPUs to use
cpu=10

# Define the range of samples
for base in SRR5292045 SRR5292046 SRR5292047 SRR5292048 SRR5292049
do
  echo "Processing $base"

  # Run featureCounts to generate count tables
  featureCounts -T $cpu \
    -a /data1/project/eunyi/tbi/data/reference/mm9.ensGene.gtf \
    -o /data1/project/eunyi/tbi/data/bowfea_counts/${base}_counts.txt \
    /data1/project/eunyi/tbi/data/bow_aligned/${base}.bam

  echo "Completed processing $base"
done
