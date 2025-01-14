#!/bin/bash

RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m'

BIN_PATH=/bin
HOME_PATH=/home/lima/rnaseq-protocol
FASTQ_PATH=$HOME_PATH/Reads
#FASTQ_PATTERN=*.fastq
#MULTIQC_COMMAND=$BIN_PATH/multiqc
#FASTQC_COMMAND=$BIN_PATH/fastqc
Trimmomatic_PATH=/home/lima/Trimmomatic-0.39
OUTPUT=$HOME_PATH/trimming_data
CORES=4

echo ¨${BLUE}Creating directory...${NC}\"

if [ ! -d $OUTPUT ]

then

 mkdir -p $OUTPUT

fi

echo "${BLUE}Trimming low quality sequences using Trimmomatic...${NC}"

for sample in 204 206 210 212 216 218; 
do
    java -jar $Trimmomatic_PATH/trimmomatic-0.39.jar PE -phred33 -threads $CORES \
        $FASTQ_PATH/SRR10207${sample}_1.fastq \
        $FASTQ_PATH/SRR10207${sample}_2.fastq \
        $OUTPUT/SRR10207${sample}_P_1.fastq $OUTPUT/SRR10207${sample}_U_1.fastq \
        $OUTPUT/SRR10207${sample}_P_2.fastq $OUTPUT/SRR10207${sample}_U_2.fastq \
        ILLUMINACLIP:/home/lima/Trimmomatic-0.39/adapters/TruSeq3-PE.fa:2:30:10 \
        SLIDINGWINDOW:4:15 MINLEN:36
done

echo "${RED}Trimmomatic filtering completed successfully!${NC}"