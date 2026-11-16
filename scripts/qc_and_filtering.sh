#!/bin/bash
# qc_and_filtering.sh
# Quality control, adapter removal, and size/quality filtering

# Variables
INPUT_FASTQ="../results/01_basecalling/raw_reads.fastq"
QC_PRE_DIR="../results/02_qc_pre"
PORECHOP_OUT="../results/02_filtered/trimmed_reads.fastq"
FINAL_FASTQ="../results/02_filtered/clean_reads.fastq"
QC_POST_DIR="../results/02_qc_post"

MIN_QUAL=10    # Phred quality threshold (Q10 = 90% accuracy)
MIN_LEN=4000   # Minimum length in base pairs (adjustable according to the size of your viral genome)

mkdir -p $QC_PRE_DIR ../results/02_filtered $QC_POST_DIR

echo "1. Running NanoPlot pre-filtering for basic statistics..."
NanoPlot --fastq $INPUT_FASTQ --outdir $QC_PRE_DIR

echo "2. Trimming adapters with Porechop..."
porechop -i $INPUT_FASTQ -o $PORECHOP_OUT 

echo "3. Filtering reads with NanoFilt (Quality > $MIN_QUAL, Length > $MIN_LEN)..."
# NanoFilt operates via pipes, reading from standard input.
cat $PORECHOP_OUT | NanoFilt -q $MIN_QUAL -l $MIN_LEN > $FINAL_FASTQ

echo "4. Running NanoPlot post-filtering to verify cleanliness..."
NanoPlot -t $THREADS --fastq $FINAL_FASTQ -o $QC_POST_DIR

echo "Filtering complete. Readings ready for assembly.: $FINAL_FASTQ"
