#!/bin/bash

RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m'

echo "${BLUE}Performing data quality analysis with FastQC...${NC}"

mkdir -p /media/jpmslima/data1/rnaseq/Raw_reads/qual
for sample in /media/jpmslima/data1/rnaseq/Raw_reads/*.fastq
do
    filename=$(basename ${sample})
    fastqc "/media/jpmslima/data1/rnaseq/Raw_reads/${filename}" --outdir "/media/jpmslima/data1/rnaseq/Raw_reads/qual/"
done

echo "${RED}FastQC analysis completed successfully!${NC}"