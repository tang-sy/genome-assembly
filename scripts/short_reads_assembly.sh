#!/bin/bash

# Download data using fasterq-dump
mkdir data/sra
fasterq-dump -e 4 --split-3 -O data/sra/ SRR28257240
gzip data/sra/SRR28257240_1.fastq
gzip data/sra/SRR28257240_2.fastq
 
# Quality check
fastqc data/sra/SRR28257240_1.fastq.gz data/sra/SRR28257240_2.fastq.gz 

# Data filtering
trimmomatic PE -threads 2 data/sra/SRR28257240_1.fastq.gz data/sra/SRR28257240_2.fastq.gz data/sra/SRR28257240_1.tr.fastq.gz data/sra/1.unpaired.fastq.gz data/sra/SRR28257240_2.tr.fastq.gz data/sra/2.unpaired.fastq.gz ILLUMINACLIP:data/adapter.fasta:2:30:10:2:True LEADING:20 TRAILING:20 HEADCROP:20 CROP:120 MINLEN:100

# Kmer analysis
mkdir data/analysis data/analysis/kmer
# Generate graphs
jellyfish count -m 23 -s 4G -t 4 -C data/sra/SRR28257240_1.tr.fastq
jellyfish stats mer_counts.jf > data/analysis/kmer/stat.txt
jellyfish histo mer_counts.jf > data/analysis/kmer/kmer.histo

# Estimate genome size
Rscript /PATH_TO_GENOMESCOPE/genomescope-1.0.0/genomescope.R data/analysis/kmer/kmer.histo 23 200 data/analysis/kmer

# Assembly
mkdir data/analysis/assembly data/analysis/assembly/ngs 
/PATH_TO_VELVET/velvet-1.2.10/velveth data/analysis/assembly 79 -shortPaired -fastq -separate data/sra/SRR28257240_1.tr.fastq.gz data/sra/SRR28257240_2.tr.fastq.gz
/PATH_TO_VELVET/velvet-1.2.10/velvetg data/analysis/assembly/ngs/

