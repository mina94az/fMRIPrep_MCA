#!/bin/bash

# Set paths and parameters
REPEATS=10
SUBJECTS_PER_REPEAT=10
BASE_DIR="/home/mina94/scratch/fixSeed_threads"

# Load FSL module
module load fsl/6.0.7.7

# Loop over repetitions
for ((rep=1; rep<=$REPEATS; rep++)); do
    # Loop over subjects within each repetition
    for ((subj=1; subj<=$SUBJECTS_PER_REPEAT; subj++)); do
        if [[ $subj -le 9 ]]; then
            # Define input and output file paths
            INPUT_FILE="$BASE_DIR/overlappingTest/atlas_Schaefer2018_100Parcels_7Networks_order_FSLMNI152_1mm.nii.gz"
            REF_FILE="$BASE_DIR/workdir_mca/workdir_${rep}/fmriprep_23_2_wf/sub_126BPCP02100${subj}_wf/bold_ses_1_task_rest_wf/bold_fit_wf/bold_reg_wf/fsl_bbr_wf/mask_t1w_brain/sub-126BPCP02100${subj}_ses-1_acq-mprage_desc-preproc_T1w_masked.nii.gz" 
            OUTPUT_FILE="$BASE_DIR/fmriprep_mca-output/iter_${rep}/sub-126BPCP02100${subj}/ses-1/func/sub-126BPCP02100${subj}_ses-1_atlas2T1w.nii.gz"

        else
            # Define input and output file paths
            INPUT_FILE="$BASE_DIR/overlappingTest/atlas_Schaefer2018_100Parcels_7Networks_order_FSLMNI152_1mm.nii.gz"
            REF_FILE="$BASE_DIR/workdir_mca/workdir_${rep}/fmriprep_23_2_wf/sub_126BPCP0210${subj}_wf/bold_ses_1_task_rest_wf/bold_fit_wf/bold_reg_wf/fsl_bbr_wf/mask_t1w_brain/sub-126BPCP0210${subj}_ses-1_acq-mprage_desc-preproc_T1w_masked.nii.gz" 
            OUTPUT_FILE="$BASE_DIR/fmriprep_mca-output/iter_${rep}/sub-126BPCP0210${subj}/ses-1/func/sub-126BPCP0210${subj}_ses-1_atlas2T1w.nii.gz"

        fi
        # Perform fslapplyxfm4
        flirt -in "$INPUT_FILE" -ref "$REF_FILE" -out "$OUTPUT_FILE"  -basescale 1 -searchcost bbr -dof 6 

    done
done


Loop over repetitions
for ((rep=1; rep<=$REPEATS; rep++)); do
    # Loop over subjects within each repetition
    for ((subj=1; subj<=$SUBJECTS_PER_REPEAT; subj++)); do
        if [[ $subj -le 9 ]]; then
            # Define input and output file paths
            INPUT_FILE="$BASE_DIR/fmriprep_mca-output/iter_${rep}/sub-126BPCP02100${subj}/ses-1/func/sub-126BPCP02100${subj}_ses-1_atlas2T1w.nii.gz"
            REF_FILE="$BASE_DIR/fmriprep_mca-output/iter_${rep}/sub-126BPCP02100${subj}/ses-1/func/sub-126BPCP02100${subj}_ses-1_task-rest_space-MNI152NLin2009cAsym_desc-brain_mask.nii.gz" 
            OUTPUT_FILE="$BASE_DIR/fmriprep_mca-output/iter_${rep}/sub-126BPCP02100${subj}/ses-1/func/sub-126BPCP02100${subj}_ses-1_shaeferinT1w2Boldmask.nii.gz"       
        else
            # Define input and output file paths
            INPUT_FILE="$BASE_DIR/fmriprep_mca-output/iter_${rep}/sub-126BPCP0210${subj}/ses-1/func/sub-126BPCP0210${subj}_ses-1_atlas2T1w.nii.gz"
            REF_FILE="$BASE_DIR/fmriprep_mca-output/iter_${rep}/sub-126BPCP0210${subj}/ses-1/func/sub-126BPCP0210${subj}_ses-1_task-rest_space-MNI152NLin2009cAsym_desc-brain_mask.nii.gz" 
            OUTPUT_FILE="$BASE_DIR/fmriprep_mca-output/iter_${rep}/sub-126BPCP0210${subj}/ses-1/func/sub-126BPCP0210${subj}_ses-1_shaeferinT1w2Boldmask.nii.gz"
        fi
        flirt -in "$INPUT_FILE" -ref "$REF_FILE" -out "$OUTPUT_FILE"  -basescale 1 -searchcost bbr -dof 6 

    done
done

# for ((rep=1; rep<=$REPEATS; rep++)); do
#     # Define input and output file paths
#     subj=10
#     INPUT_FILE="$BASE_DIR/fmriprep_mca-output/iter_${rep}/sub-126BPCP0210${subj}/ses-1/func/sub-126BPCP0210${subj}_ses-1_atlas2T1w.nii.gz"
#     REF_FILE="$BASE_DIR/fmriprep_mca-output/iter_${rep}/sub-126BPCP0210${subj}/ses-1/func/sub-126BPCP0210${subj}_ses-1_task-rest_space-MNI152NLin2009cAsym_desc-brain_mask.nii.gz" 
#     OUTPUT_FILE="$BASE_DIR/fmriprep_mca-output/iter_${rep}/sub-126BPCP0210${subj}/ses-1/func/sub-126BPCP0210${subj}_ses-1_shaeferinT1w2Boldmask.nii.gz"
#     flirt -in "$INPUT_FILE" -ref "$REF_FILE" -out "$OUTPUT_FILE"  -basescale 1 -searchcost bbr -dof 6
# done