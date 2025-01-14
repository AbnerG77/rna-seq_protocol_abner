#!/bin/bash

RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m'

## ----------------------------------------------------------------------------------------------------
## Este é o script para instalar os programas e ferramentas necessários para a análise de RNA-Seq.
## Ajuste os diretórios de acordo com a máquina onde eles irão ser executados.
## Algumas das ferramentas podems ser instaladas com "apt install", desde que esteja em uma versão
## de linux baseada no Debian/Ubuntu.
## 
## Todos as ferramentas abaixo foram executadas em máquinas de menor capacidade 
## (Ryzen 7 ou Intel Xeon com 32 GB de RAM), com o Linux Mint 21.2 e GPUs Nvidia 
## (GeForce RTX3060 e Quadro 2200, respecitvamente). Os scripts não usam as GPUs, mas muitas das
## ferramentas podem utilizar instruções CUDA/OpenCL, só configurá-las de acordo.
##
## Você irá necessitar de pelo menos 500 GB livres para armazenar todos os recursos, 
## programas, bases e arquivos iniciais, intermediários e finais.
##
## Os scripts foram adaptados/atualizados e corrigidos a partir dos disponibilizados por 
## Pola-Sanchez et al. 2024 (https://currentprotocols.onlinelibrary.wiley.com/doi/full/10.1002/cpz1.1054). 
## As correções serão descritas ao longo da execução dos scripts.
## ----------------------------------------------------------------------------------------------------
## Como executar:
## ---------------------------------------------------------------------------------------------------
## $ chmod +x install_tools.sh
## $ ./install_tools.sh
## ou
## sh install_tools.sh
------------------------------------------------------------------------------------------------------

echo "${RED}Installing tools...${NC}"

sudo apt update
sudo apt upgrade -y
sudo apt install zip unzip -y
sudo apt install fastqc -y
sudo apt install r-base -y
sudo apt install hisat2 -y
sudo apt install subread -y
sudo apt install samtools -y
sudo apt install bedtools -y
sudo apt install picard-tools -y
sudo apt install sra-toolkit -y
sudo apt install trimmomatic -y
sudo apt install multiqc -y
sudo apt install trim-galore -y
sudo apt install trinityrnaseq -y
sudo apt-get install r-base -y

##  You can also install Trimmomatic, using the available zip file:
## wget http://www.usadellab.org/cms/uploads/supplementary/Trimmomatic/Trimmomatic-0.39.zip
## unzip Trimmomatic-0.39.zip

echo "${BLUE}All tools installed successfully!${NC}"