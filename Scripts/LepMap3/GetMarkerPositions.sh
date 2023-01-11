#!/bin/bash
#SBATCH -J MarkPos
#SBATCH -n 1                # Number of cores
#SBATCH -N 1                # Ensure that all cores are on one machine
#SBATCH -t 0-02:00          # Runtime in D-HH:MM, minimum of 10 minutes
#SBATCH -p shared,unrestricted           # Partition to submit to
#SBATCH --mem=1gb           # Memory pool for all cores (see also --mem-per-cpu)
#SBATCH -o MarkPos_%j.out  # File to which STDOUT will be written, %j inserts jobid
#SBATCH -e MarkPos_%j.err  # File to which STDERR will be written, %j inserts jobid
#SBATCH --mail-type=ALL      # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=txiong@g.harvard.edu  #Email to which notifications will be sent


## working directory

chrom=$1

cd /n/holyscratch01/mallet_lab/txiong/Research/2022_HybridSterility/05.2_linkageMap.lepmap3/call_data


## command

zcat data.call.with_pseudoGrandparents.fixedDiff_only.chr.${chrom}.gz | awk '{if (NR>7) {print $2}}' >> data.call.with_pseudoGrandparents.fixedDiff_only.marker_positions/chr.${chrom}.txt