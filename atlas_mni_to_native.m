%% 1.
folder = 'C:\DATA\odmitrichenko\LC_project\MRI_data\j_bs';
files = dir(fullfile(folder, 'j_rc1bs_sP*Template.nii'));

selected_paths = fullfile ({files.folder},{files.name});
selected_paths = selected_paths (:);

%% 2. 
for sub=1:length(selected_paths)
    matlabbatch{1}.spm.spatial.normalise.write.subj.def = selected_paths(sub);
    matlabbatch{1}.spm.spatial.normalise.write.subj.resample = {'C:\DATA\odmitrichenko\LC_project\ATLAS_bs\Betts_atlas_LC.nii,1'};
    matlabbatch{1}.spm.spatial.normalise.write.woptions.bb = [-90 -156 -90
                                                          90 90 90];
    matlabbatch{1}.spm.spatial.normalise.write.woptions.vox = [1 1 1];
    matlabbatch{1}.spm.spatial.normalise.write.woptions.interp = 4;
    matlabbatch{1}.spm.spatial.normalise.write.woptions.prefix = char(extractBetween(files(sub).name,4,12));
   
    spm_jobman('run',matlabbatch)
end
