#!/bin/bash

Trinity --seqType fq --samples_file /home/lima/rnaseq-protocol/trinity_analysis/samples.txt --CPU 4 --max_memory 2G --output /home/lima/rnaseq-protocol/trinity_analysis

mv ../home/lima/rnaseq-protocol/trinity_analysis/trinity_out_dir.Trinity.fasta ../home/lima/rnaseq-protocol/trinity_analysis/Trinity.fasta 
mv ../home/lima/rnaseq-protocol/trinity_analysis/trinity_out_dir.Trinity.fasta.gene_trans_map ../home/lima/rnaseq-protocol/trinity_analysis/Trinity.fasta.gene_trans_map

#todos os  caminhos podem começar por ".." e os caminhos podem ser mais curtos e indo direto ao ponto 