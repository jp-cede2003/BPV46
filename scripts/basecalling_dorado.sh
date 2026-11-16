#!/bin/bash
# basecalling_dorado.sh
# Conversion of raw signals (POD5) to FASTQ reads using Dorado

# Variables
RAW_POD5="../data/pod5_dir"
OUTPUT_DIR="../results/01_basecalling"
MODEL="dna_r10.4.1_e8_sup@v3.3" 

mkdir -p $OUTPUT_DIR

echo "Iniciando basecalling con Dorado..."
# Note: If you experience GPU compatibility issues in WSL,
# you can force the use of the processor by adding: --device cpu

dorado basecaller --emit-fastq sup $RAW_POD5 > $OUTPUT_DIR/raw_reads.fastq

echo "Basecalling complete. File generated: $OUTPUT_DIR/raw_reads.fastq"
