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
            INPUT_FILE="$BASE_DIR/fmriprep_mca-output/iter_1/sub-126BPCP02100${subj}/ses-1/func/sub-126BPCP02100${subj}_ses-1_task-rest_timepoint-210.nii.gz"
            OUTPUT_FILE="$BASE_DIR/fmriprep_mca-output/iter_${rep}/sub-126BPCP02100${subj}/ses-1/func/sub-126BPCP02100${subj}_ses-1_task-rest_coreg-boldfixVol_flirt.nii.gz"
            REF_FILE="$BASE_DIR/workdir_mca/workdir_${rep}/fmriprep_23_2_wf/sub_126BPCP02100${subj}_wf/bold_ses_1_task_rest_wf/bold_fit_wf/bold_reg_wf/fsl_bbr_wf/mask_t1w_brain/sub-126BPCP02100${subj}_ses-1_acq-mprage_desc-preproc_T1w_masked.nii.gz" 
            TRANSFORM_FILE="$BASE_DIR/workdir_mca/workdir_${rep}/fmriprep_23_2_wf/sub_126BPCP02100${subj}_wf/bold_ses_1_task_rest_wf/bold_fit_wf/bold_reg_wf/fsl_bbr_wf/flt_bbr/sub-126BPCP02100${subj}_ses-1_task-rest_desc-coreg_boldref_flirt.mat"
        else
            # Define input and output file paths
            INPUT_FILE="$BASE_DIR/fmriprep_mca-output/iter_1/sub-126BPCP0210${subj}/ses-1/func/sub-126BPCP0210${subj}_ses-1_task-rest_timepoint-210.nii.gz"
            OUTPUT_FILE="$BASE_DIR/fmriprep_mca-output/iter_${rep}/sub-126BPCP0210${subj}/ses-1/func/sub-126BPCP0210${subj}_ses-1_task-rest_coreg-boldfixVol_flirt.nii.gz"
            REF_FILE="$BASE_DIR/workdir_mca/workdir_${rep}/fmriprep_23_2_wf/sub_126BPCP0210${subj}_wf/bold_ses_1_task_rest_wf/bold_fit_wf/bold_reg_wf/fsl_bbr_wf/mask_t1w_brain/sub-126BPCP0210${subj}_ses-1_acq-mprage_desc-preproc_T1w_masked.nii.gz" 
            TRANSFORM_FILE="$BASE_DIR/workdir_mca/workdir_${rep}/fmriprep_23_2_wf/sub_126BPCP0210${subj}_wf/bold_ses_1_task_rest_wf/bold_fit_wf/bold_reg_wf/fsl_bbr_wf/flt_bbr/sub-126BPCP0210${subj}_ses-1_task-rest_desc-coreg_boldref_flirt.mat"

        fi
        # Perform fslapplyxfm4
        flirt -in "$INPUT_FILE" -ref "$REF_FILE" -out "$OUTPUT_FILE" -applyxfm -init "$TRANSFORM_FILE" 

    done
done
