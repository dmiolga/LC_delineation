%% 1. 
folder = 'T:\LREN\PI_DRAGANSKI\odmitrichenko\LC_project\ATLAS_wb_native';
files = dir(fullfile(folder, '*.nii'));

selected_paths = fullfile ({files.folder},{files.name});
selected_paths = selected_paths (:);

%% 2.Binarizing atlases
for sub=1:length(selected_paths)

matlabbatch{1}.spm.util.imcalc.input = selected_paths(sub);
matlabbatch{1}.spm.util.imcalc.output = '';
matlabbatch{1}.spm.util.imcalc.outdir = {'T:\LREN\PI_DRAGANSKI\odmitrichenko\LC_project\Atlas_wb_nat_binarized'};
matlabbatch{1}.spm.util.imcalc.expression = 'i1>0.001';
matlabbatch{1}.spm.util.imcalc.var = struct('name', {}, 'value', {});
matlabbatch{1}.spm.util.imcalc.options.dmtx = 0;
matlabbatch{1}.spm.util.imcalc.options.mask = 0;
matlabbatch{1}.spm.util.imcalc.options.interp = 1;
matlabbatch{1}.spm.util.imcalc.options.dtype = 4;

spm_jobman('run',matlabbatch)
end