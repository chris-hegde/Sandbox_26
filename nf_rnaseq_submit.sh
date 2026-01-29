#!/bin/bash
#SBATCH --job-name=nf_rnaseq_test
#SBATCH --time=4:00:00
#SBATCH --mem=32G
#SBATCH --cpus-per-task=8
#SBATCH --output=nf_test_%j.out

module load java/17.0.6
module load singularity/3.1.0

nextflow run nf-core/rnaseq -profile test,singularity --outdir test_results