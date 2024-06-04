#!/bin/bash

# Assessment
assembly_stats data/analysis/assembly/ngs/scarffolds.fa
assembly_stats data/analysis/assembly/nano/sc.ctg.cns.fa
assembly_stats data/analysis/assembly/hybrid/assembly.fasta

# Compare short reads and long reads assembly
dnadiff -p dnadiff data/analysis/assembly/nano/sc.ctg.cns.fa data/analysis/assembly/ngs/scarffolds.fa