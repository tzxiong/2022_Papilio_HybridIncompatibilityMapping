#!/bin/bash
#SBATCH -J NGSrelate
#SBATCH -n 6              # Number of cores
#SBATCH -N 1                # Ensure that all cores are on one machine
#SBATCH -t 7-00:00          # Runtime in D-HH:MM, minimum of 10 minutes
#SBATCH -p shared,unrestricted           # Partition to submit to
#SBATCH --mem 60gb           # Memory pool for all cores (see also --me$
#SBATCH -o NGSrelate_%j.out  # File to which STDOUT will be written, %j i$
#SBATCH -e NGSrelate_%j.err  # File to which STDERR will be written, %j i$
#SBATCH --mail-type=ALL      # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=txiong@g.harvard.edu  #Email to which notifications will be sent

dir_vcf=$1
vcf_file=$2
dir_out=$3

echo "Working on: ${vcf_file}"

~/Software/ngsRelate/ngsRelate -p 8 -h ${dir_vcf}/${vcf_file} -O ${dir_out}/${vcf_file}.res