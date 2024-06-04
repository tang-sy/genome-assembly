#!/bin/bash

# Quality check
nanoQC -l 2000 data/sra/SRR28257203.fastq.gz

# Data filtering
## Trim adapter
porechop -i data/sra/SRR28257203.fastq.gz -o data/sra/SRR28257203.tr.fastq.gz

## Filter low quality bases
gunzip -c data/sra/SRR28257203.tr.fastq.gz | NanoFilt -q 12 -l 500 --headcrop 200 --tailcrop 200 | gzip > data/sra/SRR28257203.ftr.fastq.gz

# Assembly
mkdir data/analysis/assembly/nano
cd data/analysis/assembly/nano

## Construct graph with wtdbg2
PATH_TO_WTDBG2/wtdbg2/wtdbg2 -x rs -g 20m -t 2 -i data/sra/SRR28257203.ftr.fastq.gz -fo yl

## Build raw contig sequences
PATH_TO_WTDBG2/wtdbg2/wtpoa-cns -t 2 -i yl.ctg.lay.gz -fo yl.ctg.raw.fa

## Error correction
PATH_TO_MINIMAP2/minimap2 -t2 -ax map-pb -r2k data/analysis/assembly/nano/yl.ctg.raw.fa data/sra/SRR28257203.fastq.gz | samtools sort > yl.bam

## Further adjustment
samtools view -F0x900 yl.bam | PATH_TO_WTDBG2/wtdbg2/wtpoa-cns -t 2 -d data/analysis/assembly/nano/yl.ctg.raw.fa -i - -fo yl.ctg.cns.fa