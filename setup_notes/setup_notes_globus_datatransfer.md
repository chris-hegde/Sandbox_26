# How to use globus and transfer data from globus to amarel 

## Sign up for globus
- Select Rutgers
- Sign in using CAS netid and password

## Install and connect to Globus Personal Connect locally

## Request group access - see email link 
- https://app.globus.org/groups/1dc8ae45-f304-11f0-a9ce-0affecd7d007/about

## Click on the globus link in the email 
https://app.globus.org/file-manager?origin_id=a3f54c88-f414-47ef-a821-98d25e900361&origin_path=%2F

## Create a personal endpoint on Amarel 

```bash
#Connect to Amarel
ssh netid@amarel.rutgers.edu

#Install Global personal connect in the /home directory
wget https://downloads.globus.org/globus-connect-personal/v3/linux/stable/globusconnectpersonal-latest.tgz

#unpack installer and set up
tar -zxf globusconnectpersonal-latest.tgz
cd globusconnectpersonal-3.2.8
./globusconnectpersonal -setup

#prints a URL where you use rutgers authentication to acquire a code. Enter code and name the endpoint, ex. "Amarel endpoint for netID"

#To start the endpoint before transferring files 
~/globusconnectpersonal-3.2.8/globusconnectpersonal -start & #& makes sure it runs in the background

#To inactivate the endpoint
~/globusconnectpersonal-3.2.8/globusconnectpersonal -stop

#the endpoint was only permitted to access /home. To enable access to other directories, edit the config file
nano ~/.globusonline/lta/config-paths

```

## Set up globus connect personal on Amarel with scratch access 

```bash

#the config file only showed one line ~/,0,1 indicating access to /home
#add scratch directory access to the next line in the config file with read (0) and write (1) permissions 

/scratch/ch1199/,0,1

#Restart endpoint 
~/globusconnectpersonal-3.2.8/globusconnectpersonal -start &

```

## Transfer RNAseq practice data set from Trainee_Data to Amarel endpoint for ch1199
- In file manager (left side of the Globus web server), in the Collection field select Trainee_Data and on the right side of the panel, select Amarel endpoint for ch1199
- In the Path on the right side, enter /scratch/ch1199
- Press start on the left to move files to Amarel

## Transfer runs independently server-to-server. The SSH session on Amarel and the VPN can be disconnected at the step. 

## Check transferred files in Amarel

```bash
#navigate to where files are saved

cd /scratch/ch1199
ls 
cd RNAseq_practice_dataset/fastqs/
ls | head -20 #first 20 files

#Verify 51 paired-end files 
ls *_R1_001.fastq.gz | wc -l  # count R1 files
ls *_R2_001.fastq.gz | wc -l  # count R2 files

#Organise project directory according to MaGIC template 
mkdir -p analysis bin docs lib results scripts
ls

#Create project README.md in /scratch/ch1199/RNAseq_practice_dataset (placeholder incomplete)
nano README.md

```