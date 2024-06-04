#!/bin/bash

# Hybrid assembly with unicycler
unicycler -t 4 -1 data/sra/SRR28257240_1.tr.fastq.gz -2 data/sra/SRR28257240_2.tr.fastq.gz -l data/sra/SRR28257203.tr.fastq.gz -o data/analysis/assembly/