#!/bin/bash
# 07_phylogeny_raxml.sh
# Construction of the phylogenetic tree (Maximum Likelihood) using RAxML

#To ensure reproducibility, one must create a GBlocks file containing the complete L1 sequences of the viruses to be included in the phylogenetic analysis, 
#while also ensuring that the code or specific name of the outgroup is included in the file.

WORKDIR=$(pwd)

#Variables
# Define the output folder
OUTPUT_DIR="../results/07_raxml_out"
INPUT_ALIGNMENT="$WORKDIR/../results/06_alignment_out/BPVEC2024_alignment_GB.phy" 
RUN_NAME="BPVEC2024_ML_tree"
# Outgroup.  
OUTGROUP="K02718" 
RANDOM_SEED=12345
BOOTSTRAPS=1000

mkdir -p $OUTPUT_DIR
cd $OUTPUT_DIR

echo "Starting phylogenetic analysis of BPVEC2024 with RAxML..."
echo "Model: GTRGAMMA | Bootstraps: $BOOTSTRAPS | Outgroup: $OUTGROUP"

raxmlHPC \
  -f a \
  -m GTRGAMMA \
  -p $RANDOM_SEED \
  -x $RANDOM_SEED \
  -# $BOOTSTRAPS \
  -s $INPUT_ALIGNMENT \
  -n $RUN_NAME \
  -o $OUTGROUP

echo "Analysis complete."
echo "The final tree ready for publication is located at: $OUTPUT_DIR/RAxML_bipartitions.$RUN_NAME"
