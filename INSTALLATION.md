# Installation Guide

## Prerequisites
- Linux or macOS
- Conda package manager

## Software Installation
### Short reads assembly
```bash
## fastqc
$ conda install fastqc

## Trimmomatic (java required)
$ wget http://www.usadellab.org/cms/uploads/supplementary/Trimmomatic/Trimmomatic-0.39.zip
$ unzip Trimmomatic-0.39.zip

## jellyfish
$ conda install -c bioconda jellyfish

## GenomeScope (R required)
$ wget https://github.com/schatzlab/genomescope/archive/refs/tags/v1.0.0.zip
$ unzip v1.0.0.tar.gz

## velvet
wget https://github.com/dzerbino/velvet/archive/refs/tags/v1.2.10.tar.gz
tar -xzvf v1.2.10.tar.gz
rm v1.2.10.tar.gz
cd velvet-1.2.10/
make 'MAXKMERLENGTH=149'  # This parameter may need change according to tasks
```

### Long reads assembly
```bash
## Nanoqc
conda install bioconda/label/cf201901::nanoqc

## PoreChop
conda install -c bioconda porechop

## NanoFilt
conda install bioconda/label/cf201901::nanofilt

## wtdbg2
git clone https://github.com/ruanjue/wtdbg2
cd wtdbg2 && make

## minimap2
git clone https://github.com/lh3/minimap2
cd minimap2 && make
```

### Hybrid assembly
Unicycler has a lot of dependencies, including spades, racon, makeblastdb, tblastn, bowtie2, samtools, java, pilon, bcftools. It is advisable to create a separate environment for its installation.
```bash
conda create -n unicycler -c bioconda unicycler
# Reinstall some dependencies if the version is too old.
# Take samtools for example:
conda install -c bioconda samtools openssl=1.0
```

### Assessment
```bash
## assembly-stats
conda innstall -c conda-forge assembly-stats

## mummer
conda install -c bioconda mummer
```