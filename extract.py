def extract_matrix(file_path):
    with open(file_path, 'r') as file:
        lines = file.readlines()
    
    for line in lines:
        if line.startswith('Parameters:'):
            # Extract the parameters part and split into individual float values
            params = list(map(float, line.split(':')[1].strip().split()))
            break
    
    # Create the 4x4 transformation matrix
    transformation_matrix = [
        [params[0], params[1], params[2], params[3]],
        [params[4], params[5], params[6], params[7]],
        [params[8], params[9], params[10], params[11]],
        [0, 0, 0, 1]
    ]
    
    return transformation_matrix

def print_matrix(matrix):
    for row in matrix:
        print(" ".join(map(str, row)))

def save_matrix_to_file(matrix, output_file_path):
    with open(output_file_path, 'w') as file:
        for row in matrix:
            file.write(" ".join(map(str, row)) + "\n")




for j in range (1,11):
    for i in range (1,11):
    
        # File path to the input and output text file
        if j <= 9 : 
            input_file_path= f'/home/mina94/scratch/fixSeed_threads/fmriprep_mca-output/iter_{i}/sub-126BPCP02100{j}/ses-1/func/sub-126BPCP02100{j}_ses-1_task-rest_from-boldref_to-T1w_mode-image_desc-coreg_xfm.txt'
            output_file_path= f'/home/mina94/scratch/fixSeed_threads/fmriprep_mca-output/iter_{i}/sub-126BPCP02100{j}/ses-1/func/transform_matrix.txt'
        else :
            input_file_path= f'/home/mina94/scratch/fixSeed_threads/fmriprep_mca-output/iter_{i}/sub-126BPCP0210{j}/ses-1/func/sub-126BPCP0210{j}_ses-1_task-rest_from-boldref_to-T1w_mode-image_desc-coreg_xfm.txt'
            output_file_path= f'/home/mina94/scratch/fixSeed_threads/fmriprep_mca-output/iter_{i}/sub-126BPCP0210{j}/ses-1/func/transform_matrix.txt'

        # Extract the matrix
        matrix = extract_matrix(input_file_path)

        # Print the matrix to the console
        # print_matrix(matrix)

        # Save the matrix to a text file
        save_matrix_to_file(matrix, output_file_path)