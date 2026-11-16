#!/bin/bash
# 03_polishing_medaka.sh
# Second polishing cycle using Medaka (based on neural networks)

# Variables
RACON_FASTA="../results/racon_out/racon_polished.fasta"
RAW_READS="../data/nanopore_reads.fastq"
OUTPUT_DIR="../results/medaka_out"
THREADS=8
MEDAKA_MODEL="r1041_e82_400bps_sup_variant_v5.0.0" 

echo "Starting polishing with Medaka..."
medaka_consensus \
  -i $RAW_READS \
  -d $RACON_FASTA \
  -o $OUTPUT_DIR \
  -t $THREADS \
  -m $MEDAKA_MODEL

echo "Polishing complete. Consensus genome at: $OUTPUT_DIR/consensus.fasta"
