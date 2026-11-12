# BPV46
This repository contains the bioinformatics pipeline and custom shell scripts used for the de novo assembly, polishing, annotation, and phylogenetic analysis of the Bovine Papillomavirus isolate **BPVEC2024-6-22.1**, sequenced using Oxford Nanopore MinION technology.
# De novo Assembly and Phylogenetic Analysis of Bovine Papillomavirus (BPV)
## 📊 Data Availability
The raw sequencing data (FASTQ) and the final assembled genome (FASTA) are too heavy to be hosted here and have been deposited in the NCBI repository:
*   **Raw Reads (SRA):** []
*   **Assembled Genome (GenBank):** []

## Prerequisites and Environment
All scripts were designed to be executed in a Linux terminal (Ubuntu/WSL). The following tools must be installed and added to your system's PATH:
*   [Dorado](https://github.com/nanoporetech/dorado)(v1.3.0) - Basecalling
*   [Nanoplot](https://github.com/wdecoster/NanoPlot)(v1.46.1)
*   [Porechop](https://github.com/rrwick/Porechop)(v0.2.4)
*   [Nanofilt](https://github.com/wdecoster/nanofilt)(v2.8.0) 
*   [Canu](https://github.com/marbl/canu) (vX.X) - De novo assembly
*   [Racon](https://github.com/isovic/racon) (vX.X) - First polishing step
*   [Medaka](https://github.com/nanoporetech/medaka) (vX.X) - Second polishing step
*   [VAPiD](https://github.com/VAPiD/VAPiD) (vX.X) - Viral annotation
*   [RAxML](https://github.com/stamatak/standard-RAxML) (vX.X) - Maximum likelihood phylogenetic analysis
*   *Note: Tree visualization was performed locally using ITOL.*
