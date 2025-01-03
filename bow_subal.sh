#!/bin/bash
# Define the number of CPUs to use
cpu=8

# Define the range of samples
for base in SRR5292045 SRR5292046 SRR5292047 SRR5292048 SRR5292049
do
  echo "Processing $base"

  # Run Bowtie2 to align reads to the reference genome
  bowtie2 -p $cpu -x /data1/project/eunyi/tbi/data/bow_index/mm9 \
          -1 /data1/project/eunyi/tbi/data/trimmed/trimmed_${base}_1.fastq \
          -2 /data1/project/eunyi/tbi/data/trimmed/trimmed_${base}_2.fastq \
          -S /data1/project/eunyi/tbi/data/bow_aligned/${base}.sam

  # Convert SAM to BAM and sort by coordinate
  samtools view -@ $cpu -bS /data1/project/eunyi/tbi/data/bow_aligned/${base}.sam | samtools sort -@ $cpu -o /data1/project/eunyi/tbi/data/bow_aligned/${base}.bam

  # Remove the SAM file to save space
  rm /data1/project/eunyi/tbi/data/bow_aligned/${base}.sam

  echo "Completed processing $base"
done
