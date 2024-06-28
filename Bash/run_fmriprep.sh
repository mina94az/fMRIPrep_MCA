#!/bin/bash

# Name of the job (* specify job name)
#SBATCH --job-name=fmriprep

#SBATCH --ntasks=10
#SBATCH --array=1
# Request memory
#SBATCH --mem-per-cpu=30gb
# Walltime (job duration)
#SBATCH --time=35:00:00

# save logs (change YOUR-DIRECTORY to where you want to save logs)
#SBATCH --output=SLURM/%x_%a.out

# Email notifications (*comma-separated options: BEGIN,END,FAIL)
#SBATCH --mail-user=mina.alizadeh94@gmail.com
#SBATCH --mail-type=ALL
# Account to use (*change to any other account you are affiliated with)
#SBATCH --account=rrg-glatard
module load apptainer/1.2.4

parallel < Sub.txt
