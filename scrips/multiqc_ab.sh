#!/bin/bash

RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m'

BIN_PATH=/bin
HOME_PATH=/home/lima/rnaseq-protocol #caminho até onde será rodado e criado o diretório
FASTQ_PATH=$HOME_PATH/Reads #caminho até a pasta com os arquivos dos experimentos
FASTQ_PATTERN=*.fastq #forma de se conseguir todos os arquivos selecionados com "*.fastq"
MULTIQC_COMMAND=$BIN_PATH/multiqc
FASTQC_COMMAND=$BIN_PATH/fastqc
FASTQC_OUTPUT=$HOME_PATH/fastQC
CORES=4 #núcleos presentes na máquina

echo ¨${BLUE}Creating directory, doutor abner...${NC}\"

if [ ! -d $FASTQC_OUTPUT ]

then

 mkdir -p $FASTQC_OUTPUT

fi

echo "${BLUE}Performing data quality analysis with FastQC...${NC}"

$FASTQC_COMMAND --outdir $FASTQC_OUTPUT --threads $CORES $FASTQ_PATH/$FASTQ_PATTERN

echo "${BLUE}Summarizing results with MultiQC...${NC}"

$MULTIQC_COMMAND $FASTQC_OUTPUT -o $FASTQC_OUTPUT

echo "${RED}FastQC analysis completed successfully!${NC}"