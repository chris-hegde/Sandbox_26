# How to set up nextflow on Amarel and run a test using a pipeline downloaded from nf-core.

## Check if nextflow exists and if not, install
```bash

#Check /home directory space available before installs
du -sh ~/*  # shows size of each directory in home

module avail nextflow #checks 

#if not available 
cd ~
#make sure newest Java is installed/available (17 or above)
module avail java 
module load java/17.0.6
java -version 

#install nextflow 
curl -s https://get.nextflow.io | bash

#Add nextflow to PATH
mkdir -p ~/bin                           # create bin directory
mv ~/nextflow ~/bin/                     # move nextflow to bin
echo 'export PATH=$HOME/bin:$PATH' >> ~/.bashrc  # add bin to PATH permanently
source ~/.bashrc                         # reload bashrc

#Note: bashrc is the config file that runs everytime a new amarel bash session is started. It sets up the environment - directory location for commands, shortcuts, installed modules to be loaded. Adding the bin file to PATH instructs the system to allow nextflow to run from anywhere without typing the path

#Check nextflow version
nextflow -version

#check if singularity is available
module avail singularity

module load singularity/3.1.0
singularity --version

```

## Test nf-core/rna-seq with small test dataset

```bash

#work in /scratch/ch1199
mkdir -p nextflow_test && cd nextflow_test 

#run test
nextflow run nf-core/rnaseq -profile test,singularity --outdir test_results
```
# First failed instance ran in a login node accidentally and received the following error (portion shown with memory restriction)
- "ERROR ~ Error executing process > 'NFCORE_RNASEQ:RNASEQ:FASTQ_QC_TRIM_FILTER_SETSTRANDEDNESS:FASTQ_FASTQC_UMITOOLS_TRIMGALORE:TRIMGALORE (RAP1_UNINDUCED_REP2)'
Caused by:
  Process requirement exceeds available memory -- req: 15 GB; avail: 12 GB
Command executed:
  [ ! -f  RAP1_UNINDUCED_REP2_trimmed.fastq.gz ] && ln -s RAP1_UNINDUCED_REP2.merged.fastq.gz RAP1_UNINDUCED_REP2_trimmed.fastq.gz
  trim_galore \
      --fastqc_args '-t 4' \
      --cores 1 \
      --gzip \
      RAP1_UNINDUCED_REP2_trimmed.fastq.gz

  cat <<-END_VERSIONS > versions.yml"

## Re run as a SLURM submitted job on a compute node (and not a login node!)

-In VS code, created a new file nf_rnaseq_submit.sh containing a slurm script to run the nf-core/rna-seq test on a compute node for t = 4h, cpus per task = 8, and requested memory of 32gb. Test script pushed to github.

```bash
#submit batch job
sbatch nf_rnaseq_submit.sh #if successful, should see a job ID

#Check progress
squeue -u ch1199 #R for running, PD = pending 

```
## Check test output 

```bash

cd test_results
ls # see these files bbsplit  custom  fastqc  fq_lint  multiqc  pipeline_info  salmon  star_salmon  trimgalore

# important QC files 

ls multiqc/
ls fastqc

# check html multiQC
cd multiqc/star_salmon/
ls #multiqc_report_data  multiqc_report.html  multiqc_report_plots
```

## To view multiqc html (on local terminal), use scp to download file from amarel

```bash
scp ch1199@amarel.rutgers.edu:/scratch/ch1199/nextflow_test/test_results/multiqc/star_salmon/multiqc_report.html ~/Downloads/

open ~/Downloads/multiqc_report.html #opens in browser

```