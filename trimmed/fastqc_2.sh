#!/bin/bash
# Define the number of CPUs to use
cpu=5

# Define the range of samples
for base in SRR5292046 SRR5292047 SRR5292048 SRR5292049 SRR5292050
do
  echo "Processing $base"
  
  # Run fastp for quality trimming with default values, and save to the trimmed folder
  fastp -i /data1/project/eunyi/tbi/data/fastq_files/${base}_1.fastq \
        -I /data1/project/eunyi/tbi/data/fastq_files/${base}_2.fastq \
        -o /data1/project/eunyi/tbi/data/trimmed/trimmed_${base}_1.fastq \
        -O /data1/project/eunyi/tbi/data/trimmed/trimmed_${base}_2.fastq \
        -w $cpu

  # Run fastqc for quality control and save the reports in the trimmed folder
  fastqc /data1/project/eunyi/tbi/data/trimmed/trimmed_${base}_1.fastq -o /data1/project/eunyi/tbi/data/trimmed/ -t $cpu
  fastqc /data1/project/eunyi/tbi/data/trimmed/trimmed_${base}_2.fastq -o /data1/project/eunyi/tbi/data/trimmed/ -t $cpu
  
  echo "Completed processing $base"
done
