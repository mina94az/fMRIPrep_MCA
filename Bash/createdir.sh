#!/bin/bash

# Change directory to the parent directory where you want to create the subfolders
cd /home/mina94/scratch/fixSeed_threads/n4bias_input/ || exit

# Loop through numbers 1 to 10 and create the subfolders
for ((i = 1; i <= 9; i++)); do
    mkdir -p "sub_126BPCP02100$i"
done


echo "Subfolders created successfully."
