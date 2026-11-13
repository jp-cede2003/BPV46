#!/bin/bash
# 02_polishing_racon.sh
# First round of assembly polishing using Minimap2 and Racon
#This cycle should be repeated twice: first, perform mapping with Minimap2, then use Racon; the output from the Racon polishing step is then used again for a second mapping with Minimap2, and finally, Racon is used once more.

# Variables
RAW_READS="../data/nanopore_reads.fastq"
DRAFT_ASSEMBLY="../results/canu_out/BPVEC2024.contigs.fasta"
OUTPUT_DIR="../results/racon_out"
THREADS=8

mkdir -p $OUTPUT_DIR

echo "Starting mapping with Minimap2..."
minimap2 -x map-ont -t $THREADS $DRAFT_ASSEMBLY $RAW_READS > $OUTPUT_DIR/alignment1.paf

echo "Starting polishing with Racon..."
racon -t $THREADS $RAW_READS $OUTPUT_DIR/alignment.paf $DRAFT_ASSEMBLY > $OUTPUT_DIR/racon_polished.fasta

echo "Polishing with Racon completed: $OUTPUT_DIR/racon_polished.fasta"
