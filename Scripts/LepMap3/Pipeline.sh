#!/bin/bash

chromosome=$1
dir_vcf=/n/holyscratch01/mallet_lab/txiong/Research/2022_HybridSterility/03.2_call.bcftools/vcfs
dir_output=/n/holyscratch01/mallet_lab/txiong/Research/2022_HybridSterility/05.2_linkageMap.lepmap3
pedigree_file=/n/home00/txiong/Research/2022_HybridSterility/Family_Info_Finalized_withPseudoGrandParents_transposed.txt

RES=$(sbatch /n/home00/txiong/Script/S.LEPMAP3/ParentCall2.sh ${chromosome} ${dir_vcf} ${dir_output} ${pedigree_file})

sbatch --dependency=afterok:${RES##* } /n/home00/txiong/Script/S.LEPMAP3/OrderMarkers2.sh ${chromosome} ${dir_output}/call_data ${dir_output}/order_markers_results/orders ${dir_output}/order_markers_results 1 F01-F16 0.001 0.001



