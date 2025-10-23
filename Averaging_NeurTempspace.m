% Add SPM12 to MATLAB path
addpath('/Users/Olechka/spm-main');

% Define directory containing NIfTI files
input_dir = '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/NeuromorphShoot_Space';
output_dir = fullfile(input_dir, 'Processed');
if ~exist(output_dir, 'dir')
    mkdir(output_dir);
end

% Get list of NIfTI files in the directory
nifti_files = dir(fullfile(input_dir, '*.nii'));

% Initialize variables
num_files = numel(nifti_files);
if num_files == 0
    error('No NIfTI files found in the specified directory.');
end
fprintf('Processing %d NIfTI files...\n', num_files);

% Preallocate for averaging
first_file = fullfile(input_dir, nifti_files(1).name);
try
    first_vol = spm_vol(first_file);
    image_size = first_vol.dim;
catch ME
    error('Could not read the first NIfTI file. Check file compatibility.');
end
all_images = zeros(image_size);

% Step 1: Binarize images and accumulate for averaging
for i = 1:num_files
    % Load NIfTI file
    file_path = fullfile(input_dir, nifti_files(i).name);
    try
        vol = spm_vol(file_path);
        img = spm_read_vols(vol);
    catch
        fprintf('Error reading file: %s. Skipping.\n', nifti_files(i).name);
        continue;
    end
    
    % Binarize image
    bin_img = img > 0;
    
    % Save binarized image
    bin_vol = vol;
    [~, name, ext] = fileparts(nifti_files(i).name);
    bin_vol.fname = fullfile(output_dir, [name '_binarized' ext]);
    spm_write_vol(bin_vol, bin_img);
    
    % Accumulate for averaging
    all_images = all_images + bin_img;
end

% Step 2: Average the binarized images
average_image = all_images / num_files;

% Save the averaged image
avg_vol = first_vol;
avg_vol.fname = fullfile(output_dir, 'average_image.nii');
spm_write_vol(avg_vol, average_image);
fprintf('Averaged image saved to: %s\n', avg_vol.fname);

% Step 3: Apply Otsu threshold
% Reshape the averaged image to a vector for threshold calculation
flat_avg = average_image(:);
otsu_thresh = graythresh(flat_avg); % Otsu threshold (in normalized [0,1] scale)
fprintf('Otsu threshold (normalized): %.4f\n', otsu_thresh);

% Scale the threshold to match the original image intensity range
otsu_thresh_scaled = otsu_thresh * max(flat_avg(:));
fprintf('Otsu threshold (scaled to intensity range): %.4f\n', otsu_thresh_scaled);

% Binarize the averaged image using the Otsu threshold
otsu_binarized_image = average_image > otsu_thresh_scaled;

% Save the Otsu-thresholded image
otsu_vol = avg_vol;
otsu_vol.fname = fullfile(output_dir, 'otsu_binarized_image.nii');
spm_write_vol(otsu_vol, otsu_binarized_image);
fprintf('Otsu-binarized image saved to: %s\n', otsu_vol.fname);

disp('Processing complete.');
