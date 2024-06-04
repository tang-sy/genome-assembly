# Genome Assembly

## Project Overview
This project compares genome assembly results between long reads, short reads and hybrid way. The objective is to evaluate the differences in assembly quality and accuracy between these two sequencing technologies and offer insights into assembly method. 

## Table of Contents
- [Data](#data)
- [Method](#method)
- [Scripts](#scripts)
- [Results](#results)
- [Usage](#usage)
- [Contributors](#contributors)
- [License](#license)

## Data
Sequence data for this project were obtained from [NCBI SRA](https://www.ncbi.nlm.nih.gov/sra). The accession numbers of Yarrowia lipolytica FELIX_MS119 datasets are provided in the `data/` directory.

## Method
### Data preprocessing
The quality control reports are generated by FastQC and NanoQC for short reads and long reads, respectively. Trimmomatic is used for trimming and filtering the short reads data, while PoreChop and NanoFilt are for nanopore long reads. 

### Genome assembly
K-mer analysis is conducted using jellyfish and GenomeScope. Velvet is used for short reads assembly, while wtdbg2 and minimap are for long reads. Hybrid assembly is conducted by using Unicycler. Three assembled genome sequences are evaluated by assembly_stats. The assembly results between short reads and long reads is specifically compared by Mummer. 

## Scripts
Please refer to the command lines in corresponding scripts. The installation of prerequisites are listed in the [INSTALLATION](INSTALLATION.md) file for details. 

## Results
### Data quality
Illumina MiSeq data had quality score over 28, much better than the other. Nanopore MinION data contained a large amount of noise with average quality score of 10. 

### Kmer analysis
The estimated genome size is 22376555 bp.

### Assembly stats
The assembly result from Illumina MiSeq data is 20,808,721 bp, close to the hybrid assembled genome with length of 20452954 bp. However, Nanopore assembly had up to 42,503,399 bp. 

### Mummer
Most part of short reads assembled contigs overlaps with long reads assembled one. The extra fragments could be resulted from low sequencing quality.

## Usage
Install all the prerequisites referring to [INSTALLATION](INSTALLATION.md) and follow step-by-step guide in scripts.

## Contributors
- [Tang-sy](https://github.com/tang-sy) 

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

