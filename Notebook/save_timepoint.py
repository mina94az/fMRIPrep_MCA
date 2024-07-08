import nibabel as nib

# Define base path, iteration, and subject (ensure these are defined in your script)
base = '/home/mina94/scratch/fixSeed_threads/fmriprep_mca-output'
i = 1  # Example iteration
sub = 'sub-126BPCP021010'  # Example subject

# Load the 4D fMRI data
img = nib.load(f'/home/mina94/projects/rrg-glatard/mina94/tryfuzzy/ds004965/{sub}/ses-1/func/{sub}_ses-1_task-rest_bold.nii.gz')

# Get the data from the NIfTI file
fmri_data = img.get_fdata()

# Extract the 210th time point
img_timepoint = fmri_data[..., 210]

# Create a new NIfTI image for the extracted time point
img_timepoint_nifti = nib.Nifti1Image(img_timepoint, affine=img.affine)

# Save the new NIfTI image
output_path = f'{base}/iter_{i}/{sub}/ses-1/func/{sub}_ses-1_task-rest_timepoint-210.nii.gz'
nib.save(img_timepoint_nifti, output_path)

print(f'Saved extracted time point image to {output_path}')
