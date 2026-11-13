#!/bin/bash
# 01_assembly_canu.sh
# De novo assembly using Canu for Nanopore reads

# Variables (Adjust file names as appropriate)
RAW_READS="../data/nanopore_reads.fastq"
OUTPUT_DIR="../results/canu_out"
PREFIX="BPVEC2024"
GENOME_SIZE="8k" # Maximum genome size of BPVs
THREADS=8 #The number of THREADS will depend on the computer's power.

echo "Starting assembly with Canu..."

canu \
  -p $PREFIX \
  -d $OUTPUT_DIR \
  genomeSize=$GENOME_SIZE \
  -nanopore $RAW_READS
  useGrid=false \
  maxThreads=$THREADS
  
echo "Ensamblaje completado. El contig generado está en $OUTPUT_DIR"
