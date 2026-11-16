#!/bin/bash
# 06_annotation_vapid.sh
# Viral genome annotation using VAPiD and formatting for GenBank

# Variables 
INPUT_FASTA="../results/05_medaka_out/BPVEC2024_consensus.fasta"
TEMPLATE_SBT="../data/authors_metadata.sbt" 

# Path to the VAPiD script
VAPID_SCRIPT="~/VAPiD/vapid.py"
echo "Starting BPVEC2024 annotation with VAPiD (online mode)..."

python3 $VAPID_SCRIPT \
  --online \
  --dna \
  --fasta $INPUT_FASTA \
  $TEMPLATE_SBT

echo "Annotation and formatting completed."
echo "The resulting files were generated with the prefix BPVEC2024_consensus."

#If any error occurs, execute 
/tbl2asn -indir BPVEC2024_consensus -t authors_metadata.sbt -V b -a s 
