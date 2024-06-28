#!/bin/bash

# Name of the job (* specify job name)
#SBATCH --job-name=fmriprep-mca

#SBATCH --cpus-per-task=10
#SBATCH --array=1-10
# Request memory
#SBATCH --mem-per-cpu=30gb
# Walltime (job duration)
#SBATCH --time=60:00:00

# save logs (change YOUR-DIRECTORY to where you want to save logs)
#SBATCH --output=SLURM_MCA/%x_%a.out

# Email notifications (*comma-separated options: BEGIN,END,FAIL)
#SBATCH --mail-user=mina.alizadeh94@gmail.com
#SBATCH --mail-type=ALL
# Account to use (*change to any other account you are affiliated with)
#SBATCH --account=rrg-glatard
module load apptainer/1.2.4


parallel < parallelsub.txt

# parallel --header : "time apptainer exec -B /etc/pki/tls/certs/ca-bundle.crt:/etc/pki/tls/certs/ca-bundle.crt --env 'VFC_BACKENDS_SILENT_LOAD="True"' --env 'VFC_BACKENDS_LOGGER="False"' -B /home/mina94/projects/rrg-glatard/mina94/tryfuzzy/ds004965:/data -B /home/mina94/projects/rrg-glatard/mina94/tryfuzzy/workdir_mca/workdir_${SLURM_ARRAY_TASK_ID}:/work -B /home/mina94/projects/rrg-glatard/mina94/tryfuzzy/fmriprep_mca-output/iter_${SLURM_ARRAY_TASK_ID}:/output fmriprep-fuzzylibm-23.2.1.sif fmriprep /data /output participant --participant_label {subject} -w /work --skip-bids-validation  --write-graph --fs-license-file /home/mina94/projects/rrg-glatard/mina94/tryfuzzy/license.txt --fs-no-reconall" ::: subject $(SUBJECTS)