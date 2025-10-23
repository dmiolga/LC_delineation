%% Updated code that uses neuromorphometric Template_4.nii image in step in between 
% 23rd - 26th of January 2025

%% Unified segmentation of T1w images to obtain rc files
for i = 1:length(t1wFiles)
    t1wFile = fullfile(t1wPath, t1wFiles(i).name);

    % Define the segmentation batch
    matlabbatch{1}.spm.spatial.preproc.channel.vols = {t1wFile};
    matlabbatch{1}.spm.spatial.preproc.channel.biasreg = 0.001;
    matlabbatch{1}.spm.spatial.preproc.channel.biasfwhm = 60;
    matlabbatch{1}.spm.spatial.preproc.channel.write = [0 0];
    matlabbatch{1}.spm.spatial.preproc.tissue(1).tpm = {'/Users/Olechka/spm-main/tpm/enhanced_TPM.nii,1'};
    matlabbatch{1}.spm.spatial.preproc.tissue(1).ngaus = 1;
    matlabbatch{1}.spm.spatial.preproc.tissue(1).native = [1 1];
    matlabbatch{1}.spm.spatial.preproc.tissue(1).warped = [0 0];
    matlabbatch{1}.spm.spatial.preproc.tissue(2).tpm = {'/Users/Olechka/spm-main/tpm/enhanced_TPM.nii,2'};
    matlabbatch{1}.spm.spatial.preproc.tissue(2).ngaus = 1;
    matlabbatch{1}.spm.spatial.preproc.tissue(2).native = [1 1];
    matlabbatch{1}.spm.spatial.preproc.tissue(2).warped = [0 0];
    matlabbatch{1}.spm.spatial.preproc.tissue(3).tpm = {'/Users/Olechka/spm-main/tpm/enhanced_TPM.nii,3'};
    matlabbatch{1}.spm.spatial.preproc.tissue(3).ngaus = 2;
    matlabbatch{1}.spm.spatial.preproc.tissue(3).native = [1 1];
    matlabbatch{1}.spm.spatial.preproc.tissue(3).warped = [0 0];
    matlabbatch{1}.spm.spatial.preproc.tissue(4).tpm = {'/Users/Olechka/spm-main/tpm/enhanced_TPM.nii,4'};
    matlabbatch{1}.spm.spatial.preproc.tissue(4).ngaus = 3;
    matlabbatch{1}.spm.spatial.preproc.tissue(4).native = [0 0];
    matlabbatch{1}.spm.spatial.preproc.tissue(4).warped = [0 0];
    matlabbatch{1}.spm.spatial.preproc.tissue(5).tpm = {'/Users/Olechka/spm-main/tpm/enhanced_TPM.nii,5'};
    matlabbatch{1}.spm.spatial.preproc.tissue(5).ngaus = 4;
    matlabbatch{1}.spm.spatial.preproc.tissue(5).native = [0 0];
    matlabbatch{1}.spm.spatial.preproc.tissue(5).warped = [0 0];
    matlabbatch{1}.spm.spatial.preproc.tissue(6).tpm = {'/Users/Olechka/spm-main/tpm/enhanced_TPM.nii,6'};
    matlabbatch{1}.spm.spatial.preproc.tissue(6).ngaus = 2;
    matlabbatch{1}.spm.spatial.preproc.tissue(6).native = [0 0];
    matlabbatch{1}.spm.spatial.preproc.tissue(6).warped = [0 0];
    
    matlabbatch{1}.spm.spatial.preproc.warp.mrf = 1;
    matlabbatch{1}.spm.spatial.preproc.warp.cleanup = 1;
    matlabbatch{1}.spm.spatial.preproc.warp.reg = [0 0.001 0.5 0.05 0.2];
    matlabbatch{1}.spm.spatial.preproc.warp.affreg = 'mni';
    matlabbatch{1}.spm.spatial.preproc.warp.fwhm = 0;
    matlabbatch{1}.spm.spatial.preproc.warp.samp = 3;
    matlabbatch{1}.spm.spatial.preproc.warp.write = [1 1];
    matlabbatch{1}.spm.spatial.preproc.warp.vox = NaN;
    matlabbatch{1}.spm.spatial.preproc.warp.bb = [NaN NaN NaN
                                                  NaN NaN NaN];
    spm_jobman('run', matlabbatch);
end

%% Take output from Unified Segmenation of T1w images and Neuromorphometric average Template_4.nii file

matlabbatch{1}.spm.tools.shoot.warp1.images = {
                                               {
                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05468/rc1sPR05468_BC220963-0011-00001-000176-01.nii,1'
                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05470/rc1sPR05470_AMP_sub07-0002-00001-000176-01.nii,1'
                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05475/rc1sPR05475_BP250490-0011-00001-000176-01.nii,1'
                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05476/rc1sPR05476_AMP_sub08-0002-00001-000176-01.nii,1'
                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05478/rc1sPR05478_MP210591-0011-00001-000176-01.nii,1'
                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05487/rc1sPR05487_TS230991-0002-00001-000176-01.nii,1'
                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05488/rc1sPR05488_JF160665-0011-00001-000176-01.nii,1'
                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05491/rc1sPR05491_BD060172-0002-00001-000176-01.nii,1'
                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05513/rc1sPR05513_RT040889-0011-00001-000176-01.nii,1'
                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05517/rc1sPR05517_DS070360-0002-00001-000176-01.nii,1'
                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05525/rc1sPR05525_NB101091-0011-00001-000176-01.nii,1'
                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05539/rc1sPR05539_WD010441-0011-00001-000176-01.nii,1'
                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05548/rc1sPR04846_QR101293-0010-00001-000176-01_R1.nii,1'
                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05549/rc1sPR04852_RO010195-0010-00001-000176-01_R1.nii,1'
                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05556/rc1sPR05556_TL080781-0002-00001-000176-01.nii,1'
                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05562/rc1sPR05562_ML270349-0011-00001-000176-01.nii,1'
                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05565/rc1sPR05565_AMP_sub18-0002-00001-000176-01.nii,1'
                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05566/rc1sPR05566_TP020596-0011-00001-000176-01.nii,1'
                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05568/rc1sPR05568_YB240158-0011-00001-000176-01.nii,1'
                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05602/rc1sPR05602_DS140990-0011-00001-000176-01.nii,1'
                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05604/rc1sPR05604_CC270493-0011-00001-000176-01.nii,1'
                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05616/rc1sPR05616_VB090787-0011-00001-000176-01.nii,1'
                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05656/rc1sPR05656_DB220996-0011-00001-000176-01.nii,1'
                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05660/rc1sPR05660_LS220198-0002-00001-000176-01.nii,1'
                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05664/rc1sPR05664_PV010890-0011-00001-000176-01.nii,1'
                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05667/rc1sPR05667_AP100458-0011-00001-000176-01.nii,1'
                                               }
                                               }';

matlabbatch{1}.spm.tools.shoot.warp1.templates = {'/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/Template_4.nii'};

%% Perform Write Normalized to bring T1w to Neuromorphometric space
matlabbatch{1}.spm.tools.shoot.norm.template = {'/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/Template_4.nii'};

matlabbatch{1}.spm.tools.shoot.norm.data.subjs.deformations = {
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05468/y_rc1sPR05468_BC220963-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05470/y_rc1sPR05470_AMP_sub07-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05475/y_rc1sPR05475_BP250490-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05476/y_rc1sPR05476_AMP_sub08-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05478/y_rc1sPR05478_MP210591-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05487/y_rc1sPR05487_TS230991-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05488/y_rc1sPR05488_JF160665-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05491/y_rc1sPR05491_BD060172-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05513/y_rc1sPR05513_RT040889-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05517/y_rc1sPR05517_DS070360-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05525/y_rc1sPR05525_NB101091-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05539/y_rc1sPR05539_WD010441-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05548/y_rc1sPR04846_QR101293-0010-00001-000176-01_R1_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05549/y_rc1sPR04852_RO010195-0010-00001-000176-01_R1_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05556/y_rc1sPR05556_TL080781-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05562/y_rc1sPR05562_ML270349-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05565/y_rc1sPR05565_AMP_sub18-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05566/y_rc1sPR05566_TP020596-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05568/y_rc1sPR05568_YB240158-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05602/y_rc1sPR05602_DS140990-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05604/y_rc1sPR05604_CC270493-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05616/y_rc1sPR05616_VB090787-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05656/y_rc1sPR05656_DB220996-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05660/y_rc1sPR05660_LS220198-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05664/y_rc1sPR05664_PV010890-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05667/y_rc1sPR05667_AP100458-0011-00001-000176-01_Template.nii'
                                                               };

matlabbatch{1}.spm.tools.shoot.norm.data.subjs.images = {
                                                         {
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05468/sPR05468_BC220963-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05470/sPR05470_AMP_sub07-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05475/sPR05475_BP250490-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05476/sPR05476_AMP_sub08-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05478/sPR05478_MP210591-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05487/sPR05487_TS230991-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05488/sPR05488_JF160665-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05491/sPR05491_BD060172-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05513/sPR05513_RT040889-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05517/sPR05517_DS070360-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05525/sPR05525_NB101091-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05539/sPR05539_WD010441-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05548/sPR05548_QR101293-0010-00001-000176-01_A.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05549/sPR05549_RO010195-0010-00001-000176-01_A.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05556/sPR05556_TL080781-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05562/sPR05562_ML270349-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05565/sPR05565_AMP_sub18-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05566/sPR05566_TP020596-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05568/sPR05568_YB240158-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05602/sPR05602_DS140990-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05604/sPR05604_CC270493-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05616/sPR05616_VB090787-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05656/sPR05656_DB220996-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05660/sPR05660_LS220198-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05664/sPR05664_PV010890-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05667/sPR05667_AP100458-0011-00001-000176-01.nii'
                                                         }
                                                         }';
matlabbatch{1}.spm.tools.shoot.norm.vox = [NaN NaN NaN];

%% Bring NM images (previously coregistered with T1w images) to Neuromorphometric space
matlabbatch{1}.spm.tools.shoot.norm.template = {'/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/Template_4.nii'};
matlabbatch{1}.spm.tools.shoot.norm.data.subjs.deformations = {
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05468/y_rc1sPR05468_BC220963-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05470/y_rc1sPR05470_AMP_sub07-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05475/y_rc1sPR05475_BP250490-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05476/y_rc1sPR05476_AMP_sub08-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05478/y_rc1sPR05478_MP210591-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05487/y_rc1sPR05487_TS230991-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05488/y_rc1sPR05488_JF160665-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05491/y_rc1sPR05491_BD060172-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05513/y_rc1sPR05513_RT040889-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05517/y_rc1sPR05517_DS070360-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05525/y_rc1sPR05525_NB101091-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05539/y_rc1sPR05539_WD010441-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05548/y_rc1sPR04846_QR101293-0010-00001-000176-01_R1_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05549/y_rc1sPR04852_RO010195-0010-00001-000176-01_R1_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05556/y_rc1sPR05556_TL080781-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05562/y_rc1sPR05562_ML270349-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05565/y_rc1sPR05565_AMP_sub18-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05566/y_rc1sPR05566_TP020596-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05568/y_rc1sPR05568_YB240158-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05602/y_rc1sPR05602_DS140990-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05604/y_rc1sPR05604_CC270493-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05616/y_rc1sPR05616_VB090787-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05656/y_rc1sPR05656_DB220996-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05660/y_rc1sPR05660_LS220198-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05664/y_rc1sPR05664_PV010890-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05667/y_rc1sPR05667_AP100458-0011-00001-000176-01_Template.nii'
                                                               };

matlabbatch{1}.spm.tools.shoot.norm.data.subjs.images = {
                                                         {
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/coreg_sPR05468_BC220963-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/coreg_sPR05470_AMP_sub07-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/coreg_sPR05475_BP250490-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/coreg_sPR05476_AMP_sub08-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/coreg_sPR05478_MP210591-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/coreg_sPR05487_TS230991-0006-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/coreg_sPR05488_JF160665-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/coreg_sPR05491_BD060172-0003-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/coreg_sPR05513_RT040889-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/coreg_sPR05517_DS070360-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/coreg_sPR05525_NB101091-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/coreg_sPR05539_WD010441-0012-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/coreg_sPR05548_RO010195-0004-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/coreg_sPR05549_QR101293-0002-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/coreg_sPR05556_TL080781-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/coreg_sPR05562_ML270349-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/coreg_sPR05565_AMP_sub18-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/coreg_sPR05566_TP020596-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/coreg_sPR05568_YB240158-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/coreg_sPR05602_DS140990-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/coreg_sPR05604_CC270493-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/coreg_sPR05616_VB090787-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/coreg_sPR05656_DB220996-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/coreg_sPR05660_LS220198-0003-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/coreg_sPR05664_PV010890-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/coreg_sPR05667_AP100458-0013-00001-000001-01.nii'
                                                         }
                                                         }';
matlabbatch{1}.spm.tools.shoot.norm.vox = [NaN NaN NaN];
matlabbatch{1}.spm.tools.shoot.norm.bb = [NaN NaN NaN
                                          NaN NaN NaN];
matlabbatch{1}.spm.tools.shoot.norm.preserve = 0;
matlabbatch{1}.spm.tools.shoot.norm.fwhm = 0;

%% Bring Man Seg frequency masks for each subject (previously coregistered with T1w images) to Neuromorphometric space
matlabbatch{1}.spm.tools.shoot.norm.template = {'/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/Template_4.nii'};
matlabbatch{1}.spm.tools.shoot.norm.data.subjs.deformations = {
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05468/y_rc1sPR05468_BC220963-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05470/y_rc1sPR05470_AMP_sub07-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05475/y_rc1sPR05475_BP250490-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05476/y_rc1sPR05476_AMP_sub08-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05478/y_rc1sPR05478_MP210591-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05487/y_rc1sPR05487_TS230991-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05488/y_rc1sPR05488_JF160665-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05491/y_rc1sPR05491_BD060172-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05513/y_rc1sPR05513_RT040889-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05517/y_rc1sPR05517_DS070360-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05525/y_rc1sPR05525_NB101091-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05539/y_rc1sPR05539_WD010441-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05548/y_rc1sPR04846_QR101293-0010-00001-000176-01_R1_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05549/y_rc1sPR04852_RO010195-0010-00001-000176-01_R1_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05556/y_rc1sPR05556_TL080781-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05562/y_rc1sPR05562_ML270349-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05565/y_rc1sPR05565_AMP_sub18-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05566/y_rc1sPR05566_TP020596-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05568/y_rc1sPR05568_YB240158-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05602/y_rc1sPR05602_DS140990-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05604/y_rc1sPR05604_CC270493-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05616/y_rc1sPR05616_VB090787-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05656/y_rc1sPR05656_DB220996-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05660/y_rc1sPR05660_LS220198-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05664/y_rc1sPR05664_PV010890-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05667/y_rc1sPR05667_AP100458-0011-00001-000176-01_Template.nii'
                                                               };
matlabbatch{1}.spm.tools.shoot.norm.data.subjs.images = {
                                                         {
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/rPR05468_probabilistic_map_exclude_GB.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/rPR05470_probabilistic_map_exclude_GB.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/rPR05475_probabilistic_map_exclude_GB.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/rPR05476_probabilistic_map_exclude_GB.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/rPR05478_probabilistic_map_exclude_GB.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/rPR05487_probabilistic_map_exclude_GB.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/rPR05488_probabilistic_map_exclude_GB.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/rPR05491_probabilistic_map_exclude_GB.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/rPR05513_probabilistic_map_exclude_GB.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/rPR05517_probabilistic_map_exclude_GB.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/rPR05525_probabilistic_map_exclude_GB.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/rPR05539_probabilistic_map_exclude_GB.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/rPR05548_probabilistic_map_exclude_GB.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/rPR05549_probabilistic_map_exclude_GB.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/rPR05556_probabilistic_map_exclude_GB.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/rPR05562_probabilistic_map_exclude_GB.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/rPR05565_probabilistic_map_exclude_GB.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/rPR05566_probabilistic_map_exclude_GB.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/rPR05568_probabilistic_map_exclude_GB.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/rPR05602_probabilistic_map_exclude_GB.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/rPR05604_probabilistic_map_exclude_GB.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/rPR05616_probabilistic_map_exclude_GB.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/rPR05656_probabilistic_map_exclude_GB.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/rPR05660_probabilistic_map_exclude_GB.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/rPR05664_probabilistic_map_exclude_GB.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/rPR05667_probabilistic_map_exclude_GB.nii'
                                                         }
                                                         }';
matlabbatch{1}.spm.tools.shoot.norm.vox = [NaN NaN NaN];
matlabbatch{1}.spm.tools.shoot.norm.bb = [NaN NaN NaN
                                          NaN NaN NaN];
matlabbatch{1}.spm.tools.shoot.norm.preserve = 0;
matlabbatch{1}.spm.tools.shoot.norm.fwhm = 0;

%% Getting from Neuromorphometric space to MNI space and reverse.
% Due to our neuromorphometric pipline it is crucial to establish a way to
% get between these two spaces.

% For the next step I have tried it all: Write Normalized, Normalize:Write
% but this did not leave me a deformation field and it was also not as well
% aligned as it should be. Therefore here the approach with the best result:

%% Create segmentations of a single MNI space brain -> purpose it to obtain rc files

matlabbatch{1}.spm.spatial.preproc.channel.vols = {'/Users/Olechka/spm-main/canonical/single_subj_T1.nii,1'};
matlabbatch{1}.spm.spatial.preproc.channel.biasreg = 0.0001;
matlabbatch{1}.spm.spatial.preproc.channel.biasfwhm = 60;
matlabbatch{1}.spm.spatial.preproc.channel.write = [0 0];
matlabbatch{1}.spm.spatial.preproc.tissue(1).tpm = {'/Users/Olechka/spm-main/tpm/TPM.nii,1'};
matlabbatch{1}.spm.spatial.preproc.tissue(1).ngaus = 1;
matlabbatch{1}.spm.spatial.preproc.tissue(1).native = [1 1];
matlabbatch{1}.spm.spatial.preproc.tissue(1).warped = [0 0];
matlabbatch{1}.spm.spatial.preproc.tissue(2).tpm = {'/Users/Olechka/spm-main/tpm/TPM.nii,2'};
matlabbatch{1}.spm.spatial.preproc.tissue(2).ngaus = 1;
matlabbatch{1}.spm.spatial.preproc.tissue(2).native = [1 1];
matlabbatch{1}.spm.spatial.preproc.tissue(2).warped = [0 0];
matlabbatch{1}.spm.spatial.preproc.tissue(3).tpm = {'/Users/Olechka/spm-main/tpm/TPM.nii,3'};
matlabbatch{1}.spm.spatial.preproc.tissue(3).ngaus = 2;
matlabbatch{1}.spm.spatial.preproc.tissue(3).native = [1 1];
matlabbatch{1}.spm.spatial.preproc.tissue(3).warped = [0 0];
matlabbatch{1}.spm.spatial.preproc.tissue(4).tpm = {'/Users/Olechka/spm-main/tpm/TPM.nii,4'};
matlabbatch{1}.spm.spatial.preproc.tissue(4).ngaus = 3;
matlabbatch{1}.spm.spatial.preproc.tissue(4).native = [0 0];
matlabbatch{1}.spm.spatial.preproc.tissue(4).warped = [0 0];
matlabbatch{1}.spm.spatial.preproc.tissue(5).tpm = {'/Users/Olechka/spm-main/tpm/TPM.nii,5'};
matlabbatch{1}.spm.spatial.preproc.tissue(5).ngaus = 4;
matlabbatch{1}.spm.spatial.preproc.tissue(5).native = [1 0];
matlabbatch{1}.spm.spatial.preproc.tissue(5).warped = [0 0];
matlabbatch{1}.spm.spatial.preproc.tissue(6).tpm = {'/Users/Olechka/spm-main/tpm/TPM.nii,6'};
matlabbatch{1}.spm.spatial.preproc.tissue(6).ngaus = 2;
matlabbatch{1}.spm.spatial.preproc.tissue(6).native = [0 0];
matlabbatch{1}.spm.spatial.preproc.tissue(6).warped = [0 0];
matlabbatch{1}.spm.spatial.preproc.warp.mrf = 1;
matlabbatch{1}.spm.spatial.preproc.warp.cleanup = 1;
matlabbatch{1}.spm.spatial.preproc.warp.reg = [0 0 0.1 0.01 0.04];
matlabbatch{1}.spm.spatial.preproc.warp.affreg = 'mni';
matlabbatch{1}.spm.spatial.preproc.warp.fwhm = 0;
matlabbatch{1}.spm.spatial.preproc.warp.samp = 3;
matlabbatch{1}.spm.spatial.preproc.warp.write = [1 1];
matlabbatch{1}.spm.spatial.preproc.warp.vox = NaN;
matlabbatch{1}.spm.spatial.preproc.warp.bb = [NaN NaN NaN
                                              NaN NaN NaN];

%% Create an average image for MNI space (BTW, avgMNI brain from SPM does not work as a Template for shoot)
matlabbatch{1}.spm.tools.shoot.warp.images = {
                                              {'/Users/Olechka/spm-main/canonical/rc1single_subj_T1.nii,1'}
                                              {'/Users/Olechka/spm-main/canonical/rc2single_subj_T1.nii,1'}
                                              }';
%% Coregister images from the Neuromorp space to our newly created Template 4 in MNI space (linear transformation)

matlabbatch{1}.spm.spatial.coreg.write.ref = {'/Users/Olechka/spm-main/canonical/Template_4.nii,1'};
matlabbatch{1}.spm.spatial.coreg.write.source = {
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05468/wsPR05468_BC220963-0011-00001-000176-01.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05470/wsPR05470_AMP_sub07-0002-00001-000176-01.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05475/wsPR05475_BP250490-0011-00001-000176-01.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05476/wsPR05476_AMP_sub08-0002-00001-000176-01.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05478/wsPR05478_MP210591-0011-00001-000176-01.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05487/wsPR05487_TS230991-0002-00001-000176-01.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05488/wsPR05488_JF160665-0011-00001-000176-01.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05491/wsPR05491_BD060172-0002-00001-000176-01.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05513/wsPR05513_RT040889-0011-00001-000176-01.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05517/wsPR05517_DS070360-0002-00001-000176-01.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05525/wsPR05525_NB101091-0011-00001-000176-01.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05539/wsPR05539_WD010441-0011-00001-000176-01.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05548/wsPR05548_QR101293-0010-00001-000176-01_A.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05549/wsPR05549_RO010195-0010-00001-000176-01_A.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05556/wsPR05556_TL080781-0002-00001-000176-01.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05562/wsPR05562_ML270349-0011-00001-000176-01.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05565/wsPR05565_AMP_sub18-0002-00001-000176-01.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05566/wsPR05566_TP020596-0011-00001-000176-01.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05568/wsPR05568_YB240158-0011-00001-000176-01.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05602/wsPR05602_DS140990-0011-00001-000176-01.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05604/wsPR05604_CC270493-0011-00001-000176-01.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05616/wsPR05616_VB090787-0011-00001-000176-01.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05656/wsPR05656_DB220996-0011-00001-000176-01.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05660/wsPR05660_LS220198-0002-00001-000176-01.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05664/wsPR05664_PV010890-0011-00001-000176-01.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05667/wsPR05667_AP100458-0011-00001-000176-01.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/NeuromorphShoot_Space/wcoreg_sPR05468_BC220963-0013-00001-000001-01.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/NeuromorphShoot_Space/wcoreg_sPR05470_AMP_sub07-0013-00001-000001-01.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/NeuromorphShoot_Space/wcoreg_sPR05475_BP250490-0013-00001-000001-01.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/NeuromorphShoot_Space/wcoreg_sPR05476_AMP_sub08-0013-00001-000001-01.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/NeuromorphShoot_Space/wcoreg_sPR05478_MP210591-0013-00001-000001-01.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/NeuromorphShoot_Space/wcoreg_sPR05487_TS230991-0006-00001-000001-01.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/NeuromorphShoot_Space/wcoreg_sPR05488_JF160665-0013-00001-000001-01.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/NeuromorphShoot_Space/wcoreg_sPR05491_BD060172-0003-00001-000001-01.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/NeuromorphShoot_Space/wcoreg_sPR05513_RT040889-0013-00001-000001-01.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/NeuromorphShoot_Space/wcoreg_sPR05517_DS070360-0013-00001-000001-01.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/NeuromorphShoot_Space/wcoreg_sPR05525_NB101091-0013-00001-000001-01.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/NeuromorphShoot_Space/wcoreg_sPR05539_WD010441-0012-00001-000001-01.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/NeuromorphShoot_Space/wcoreg_sPR05548_RO010195-0004-00001-000001-01.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/NeuromorphShoot_Space/wcoreg_sPR05549_QR101293-0002-00001-000001-01.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/NeuromorphShoot_Space/wcoreg_sPR05556_TL080781-0013-00001-000001-01.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/NeuromorphShoot_Space/wcoreg_sPR05562_ML270349-0013-00001-000001-01.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/NeuromorphShoot_Space/wcoreg_sPR05565_AMP_sub18-0013-00001-000001-01.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/NeuromorphShoot_Space/wcoreg_sPR05566_TP020596-0013-00001-000001-01.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/NeuromorphShoot_Space/wcoreg_sPR05568_YB240158-0013-00001-000001-01.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/NeuromorphShoot_Space/wcoreg_sPR05602_DS140990-0013-00001-000001-01.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/NeuromorphShoot_Space/wcoreg_sPR05604_CC270493-0013-00001-000001-01.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/NeuromorphShoot_Space/wcoreg_sPR05616_VB090787-0013-00001-000001-01.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/NeuromorphShoot_Space/wcoreg_sPR05656_DB220996-0013-00001-000001-01.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/NeuromorphShoot_Space/wcoreg_sPR05660_LS220198-0003-00001-000001-01.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/NeuromorphShoot_Space/wcoreg_sPR05664_PV010890-0013-00001-000001-01.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/NeuromorphShoot_Space/wcoreg_sPR05667_AP100458-0013-00001-000001-01.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/NeuromorphShoot_Space/wrPR05468_probabilistic_map_exclude_GB.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/NeuromorphShoot_Space/wrPR05470_probabilistic_map_exclude_GB.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/NeuromorphShoot_Space/wrPR05475_probabilistic_map_exclude_GB.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/NeuromorphShoot_Space/wrPR05476_probabilistic_map_exclude_GB.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/NeuromorphShoot_Space/wrPR05478_probabilistic_map_exclude_GB.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/NeuromorphShoot_Space/wrPR05487_probabilistic_map_exclude_GB.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/NeuromorphShoot_Space/wrPR05488_probabilistic_map_exclude_GB.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/NeuromorphShoot_Space/wrPR05491_probabilistic_map_exclude_GB.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/NeuromorphShoot_Space/wrPR05513_probabilistic_map_exclude_GB.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/NeuromorphShoot_Space/wrPR05517_probabilistic_map_exclude_GB.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/NeuromorphShoot_Space/wrPR05525_probabilistic_map_exclude_GB.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/NeuromorphShoot_Space/wrPR05539_probabilistic_map_exclude_GB.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/NeuromorphShoot_Space/wrPR05548_probabilistic_map_exclude_GB.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/NeuromorphShoot_Space/wrPR05549_probabilistic_map_exclude_GB.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/NeuromorphShoot_Space/wrPR05556_probabilistic_map_exclude_GB.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/NeuromorphShoot_Space/wrPR05562_probabilistic_map_exclude_GB.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/NeuromorphShoot_Space/wrPR05565_probabilistic_map_exclude_GB.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/NeuromorphShoot_Space/wrPR05566_probabilistic_map_exclude_GB.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/NeuromorphShoot_Space/wrPR05568_probabilistic_map_exclude_GB.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/NeuromorphShoot_Space/wrPR05602_probabilistic_map_exclude_GB.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/NeuromorphShoot_Space/wrPR05604_probabilistic_map_exclude_GB.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/NeuromorphShoot_Space/wrPR05616_probabilistic_map_exclude_GB.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/NeuromorphShoot_Space/wrPR05656_probabilistic_map_exclude_GB.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/NeuromorphShoot_Space/wrPR05660_probabilistic_map_exclude_GB.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/NeuromorphShoot_Space/wrPR05664_probabilistic_map_exclude_GB.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/NeuromorphShoot_Space/wrPR05667_probabilistic_map_exclude_GB.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/NeuromorphShoot_Space/Processed/wrPR05470_probabilistic_map_exclude_GB_binarized.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/NeuromorphShoot_Space/Processed/wrPR05475_probabilistic_map_exclude_GB_binarized.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/NeuromorphShoot_Space/Processed/wrPR05476_probabilistic_map_exclude_GB_binarized.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/NeuromorphShoot_Space/Processed/wrPR05478_probabilistic_map_exclude_GB_binarized.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/NeuromorphShoot_Space/Processed/wrPR05487_probabilistic_map_exclude_GB_binarized.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/NeuromorphShoot_Space/Processed/wrPR05488_probabilistic_map_exclude_GB_binarized.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/NeuromorphShoot_Space/Processed/wrPR05491_probabilistic_map_exclude_GB_binarized.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/NeuromorphShoot_Space/Processed/wrPR05513_probabilistic_map_exclude_GB_binarized.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/NeuromorphShoot_Space/Processed/wrPR05517_probabilistic_map_exclude_GB_binarized.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/NeuromorphShoot_Space/Processed/wrPR05525_probabilistic_map_exclude_GB_binarized.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/NeuromorphShoot_Space/Processed/wrPR05539_probabilistic_map_exclude_GB_binarized.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/NeuromorphShoot_Space/Processed/wrPR05548_probabilistic_map_exclude_GB_binarized.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/NeuromorphShoot_Space/Processed/wrPR05549_probabilistic_map_exclude_GB_binarized.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/NeuromorphShoot_Space/Processed/wrPR05556_probabilistic_map_exclude_GB_binarized.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/NeuromorphShoot_Space/Processed/wrPR05562_probabilistic_map_exclude_GB_binarized.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/NeuromorphShoot_Space/Processed/wrPR05565_probabilistic_map_exclude_GB_binarized.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/NeuromorphShoot_Space/Processed/wrPR05566_probabilistic_map_exclude_GB_binarized.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/NeuromorphShoot_Space/Processed/wrPR05568_probabilistic_map_exclude_GB_binarized.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/NeuromorphShoot_Space/Processed/wrPR05602_probabilistic_map_exclude_GB_binarized.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/NeuromorphShoot_Space/Processed/wrPR05604_probabilistic_map_exclude_GB_binarized.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/NeuromorphShoot_Space/Processed/wrPR05616_probabilistic_map_exclude_GB_binarized.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/NeuromorphShoot_Space/Processed/wrPR05656_probabilistic_map_exclude_GB_binarized.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/NeuromorphShoot_Space/Processed/wrPR05660_probabilistic_map_exclude_GB_binarized.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/NeuromorphShoot_Space/Processed/wrPR05664_probabilistic_map_exclude_GB_binarized.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/NeuromorphShoot_Space/Processed/wrPR05667_probabilistic_map_exclude_GB_binarized.nii,1'
                                                 '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/NeuromorphShoot_Space/Processed/wrPR05468_probabilistic_map_exclude_GB_binarized.nii,1'
                                                 };
matlabbatch{1}.spm.spatial.coreg.write.roptions.interp = 4;
matlabbatch{1}.spm.spatial.coreg.write.roptions.wrap = [0 0 0];
matlabbatch{1}.spm.spatial.coreg.write.roptions.mask = 0;
matlabbatch{1}.spm.spatial.coreg.write.roptions.prefix = 'r';

%% Create Deformation Fields via Batch: Shoot (existing Templates)
matlabbatch{1}.spm.tools.shoot.warp1.images = {
                                               {
                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05468/rwsPR05468_BC220963-0011-00001-000176-01.nii,1'
                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05470/rwsPR05470_AMP_sub07-0002-00001-000176-01.nii,1'
                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05475/rwsPR05475_BP250490-0011-00001-000176-01.nii,1'
                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05476/rwsPR05476_AMP_sub08-0002-00001-000176-01.nii,1'
                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05478/rwsPR05478_MP210591-0011-00001-000176-01.nii,1'
                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05487/rwsPR05487_TS230991-0002-00001-000176-01.nii,1'
                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05488/rwsPR05488_JF160665-0011-00001-000176-01.nii,1'
                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05491/rwsPR05491_BD060172-0002-00001-000176-01.nii,1'
                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05513/rwsPR05513_RT040889-0011-00001-000176-01.nii,1'
                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05517/rwsPR05517_DS070360-0002-00001-000176-01.nii,1'
                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05525/rwsPR05525_NB101091-0011-00001-000176-01.nii,1'
                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05539/rwsPR05539_WD010441-0011-00001-000176-01.nii,1'
                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05548/rwsPR05548_QR101293-0010-00001-000176-01_A.nii,1'
                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05549/rwsPR05549_RO010195-0010-00001-000176-01_A.nii,1'
                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05556/rwsPR05556_TL080781-0002-00001-000176-01.nii,1'
                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05562/rwsPR05562_ML270349-0011-00001-000176-01.nii,1'
                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05565/rwsPR05565_AMP_sub18-0002-00001-000176-01.nii,1'
                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05566/rwsPR05566_TP020596-0011-00001-000176-01.nii,1'
                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05568/rwsPR05568_YB240158-0011-00001-000176-01.nii,1'
                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05602/rwsPR05602_DS140990-0011-00001-000176-01.nii,1'
                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05604/rwsPR05604_CC270493-0011-00001-000176-01.nii,1'
                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05616/rwsPR05616_VB090787-0011-00001-000176-01.nii,1'
                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05656/rwsPR05656_DB220996-0011-00001-000176-01.nii,1'
                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05660/rwsPR05660_LS220198-0002-00001-000176-01.nii,1'
                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05664/rwsPR05664_PV010890-0011-00001-000176-01.nii,1'
                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05667/rwsPR05667_AP100458-0011-00001-000176-01.nii,1'
                                               }
                                               }';
matlabbatch{1}.spm.tools.shoot.warp1.templates = {'/Users/Olechka/spm-main/canonical/Template_4.nii'};

%% Apply deformation fields on coreg Neuromorphometric space images to bring to MNI (nonlinear transformationspm
% )
matlabbatch{1}.spm.tools.shoot.norm.template = {'/Users/Olechka/spm-main/canonical/Template_4.nii'};
matlabbatch{1}.spm.tools.shoot.norm.data.subjs.deformations = {
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05468/y_rwsPR05468_BC220963-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05470/y_rwsPR05470_AMP_sub07-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05475/y_rwsPR05475_BP250490-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05476/y_rwsPR05476_AMP_sub08-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05478/y_rwsPR05478_MP210591-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05487/y_rwsPR05487_TS230991-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05488/y_rwsPR05488_JF160665-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05491/y_rwsPR05491_BD060172-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05513/y_rwsPR05513_RT040889-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05517/y_rwsPR05517_DS070360-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05525/y_rwsPR05525_NB101091-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05539/y_rwsPR05539_WD010441-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05548/y_rwsPR05548_QR101293-0010-00001-000176-01_A_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05549/y_rwsPR05549_RO010195-0010-00001-000176-01_A_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05556/y_rwsPR05556_TL080781-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05562/y_rwsPR05562_ML270349-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05565/y_rwsPR05565_AMP_sub18-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05566/y_rwsPR05566_TP020596-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05568/y_rwsPR05568_YB240158-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05602/y_rwsPR05602_DS140990-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05604/y_rwsPR05604_CC270493-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05616/y_rwsPR05616_VB090787-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05656/y_rwsPR05656_DB220996-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05660/y_rwsPR05660_LS220198-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05664/y_rwsPR05664_PV010890-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05667/y_rwsPR05667_AP100458-0011-00001-000176-01_Template.nii'
                                                               };

matlabbatch{1}.spm.tools.shoot.norm.data.subjs.images = {
                                                         {
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05468/rwsPR05468_BC220963-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05470/rwsPR05470_AMP_sub07-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05475/rwsPR05475_BP250490-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05476/rwsPR05476_AMP_sub08-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05478/rwsPR05478_MP210591-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05487/rwsPR05487_TS230991-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05488/rwsPR05488_JF160665-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05491/rwsPR05491_BD060172-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05513/rwsPR05513_RT040889-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05517/rwsPR05517_DS070360-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05525/rwsPR05525_NB101091-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05539/rwsPR05539_WD010441-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05548/rwsPR05548_QR101293-0010-00001-000176-01_A.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05549/rwsPR05549_RO010195-0010-00001-000176-01_A.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05556/rwsPR05556_TL080781-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05562/rwsPR05562_ML270349-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05565/rwsPR05565_AMP_sub18-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05566/rwsPR05566_TP020596-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05568/rwsPR05568_YB240158-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05602/rwsPR05602_DS140990-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05604/rwsPR05604_CC270493-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05616/rwsPR05616_VB090787-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05656/rwsPR05656_DB220996-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05660/rwsPR05660_LS220198-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05664/rwsPR05664_PV010890-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05667/rwsPR05667_AP100458-0011-00001-000176-01.nii'
                                                         }
                                                         }';
matlabbatch{1}.spm.tools.shoot.norm.vox = [1 1 1];
matlabbatch{1}.spm.tools.shoot.norm.bb = [NaN NaN NaN
                                          NaN NaN NaN];
matlabbatch{1}.spm.tools.shoot.norm.preserve = 0;
matlabbatch{1}.spm.tools.shoot.norm.fwhm = 0;
matlabbatch{2}.spm.tools.shoot.norm.template = {'/Users/Olechka/spm-main/canonical/Template_4.nii'};

matlabbatch{2}.spm.tools.shoot.norm.data.subjs.deformations = {
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05468/y_rwsPR05468_BC220963-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05470/y_rwsPR05470_AMP_sub07-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05475/y_rwsPR05475_BP250490-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05476/y_rwsPR05476_AMP_sub08-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05478/y_rwsPR05478_MP210591-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05487/y_rwsPR05487_TS230991-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05488/y_rwsPR05488_JF160665-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05491/y_rwsPR05491_BD060172-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05513/y_rwsPR05513_RT040889-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05517/y_rwsPR05517_DS070360-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05525/y_rwsPR05525_NB101091-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05539/y_rwsPR05539_WD010441-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05548/y_rwsPR05548_QR101293-0010-00001-000176-01_A_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05549/y_rwsPR05549_RO010195-0010-00001-000176-01_A_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05556/y_rwsPR05556_TL080781-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05562/y_rwsPR05562_ML270349-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05565/y_rwsPR05565_AMP_sub18-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05566/y_rwsPR05566_TP020596-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05568/y_rwsPR05568_YB240158-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05602/y_rwsPR05602_DS140990-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05604/y_rwsPR05604_CC270493-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05616/y_rwsPR05616_VB090787-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05656/y_rwsPR05656_DB220996-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05660/y_rwsPR05660_LS220198-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05664/y_rwsPR05664_PV010890-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05667/y_rwsPR05667_AP100458-0011-00001-000176-01_Template.nii'
                                                               };
matlabbatch{2}.spm.tools.shoot.norm.data.subjs.images = {
                                                         {
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/MNIcoregaftershoot_Space/rwcoreg_sPR05468_BC220963-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/MNIcoregaftershoot_Space/rwcoreg_sPR05470_AMP_sub07-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/MNIcoregaftershoot_Space/rwcoreg_sPR05475_BP250490-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/MNIcoregaftershoot_Space/rwcoreg_sPR05476_AMP_sub08-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/MNIcoregaftershoot_Space/rwcoreg_sPR05478_MP210591-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/MNIcoregaftershoot_Space/rwcoreg_sPR05487_TS230991-0006-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/MNIcoregaftershoot_Space/rwcoreg_sPR05488_JF160665-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/MNIcoregaftershoot_Space/rwcoreg_sPR05491_BD060172-0003-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/MNIcoregaftershoot_Space/rwcoreg_sPR05513_RT040889-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/MNIcoregaftershoot_Space/rwcoreg_sPR05517_DS070360-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/MNIcoregaftershoot_Space/rwcoreg_sPR05525_NB101091-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/MNIcoregaftershoot_Space/rwcoreg_sPR05539_WD010441-0012-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/MNIcoregaftershoot_Space/rwcoreg_sPR05548_RO010195-0004-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/MNIcoregaftershoot_Space/rwcoreg_sPR05549_QR101293-0002-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/MNIcoregaftershoot_Space/rwcoreg_sPR05556_TL080781-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/MNIcoregaftershoot_Space/rwcoreg_sPR05562_ML270349-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/MNIcoregaftershoot_Space/rwcoreg_sPR05565_AMP_sub18-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/MNIcoregaftershoot_Space/rwcoreg_sPR05566_TP020596-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/MNIcoregaftershoot_Space/rwcoreg_sPR05568_YB240158-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/MNIcoregaftershoot_Space/rwcoreg_sPR05602_DS140990-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/MNIcoregaftershoot_Space/rwcoreg_sPR05604_CC270493-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/MNIcoregaftershoot_Space/rwcoreg_sPR05616_VB090787-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/MNIcoregaftershoot_Space/rwcoreg_sPR05656_DB220996-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/MNIcoregaftershoot_Space/rwcoreg_sPR05660_LS220198-0003-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/MNIcoregaftershoot_Space/rwcoreg_sPR05664_PV010890-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/NM_processing/MNIcoregaftershoot_Space/rwcoreg_sPR05667_AP100458-0013-00001-000001-01.nii'
                                                         }
                                                         }';
matlabbatch{2}.spm.tools.shoot.norm.vox = [1 1 1];
matlabbatch{2}.spm.tools.shoot.norm.bb = [NaN NaN NaN
                                          NaN NaN NaN];
matlabbatch{2}.spm.tools.shoot.norm.preserve = 0;
matlabbatch{2}.spm.tools.shoot.norm.fwhm = 0;
matlabbatch{3}.spm.tools.shoot.norm.template = {'/Users/Olechka/spm-main/canonical/Template_4.nii'};

matlabbatch{3}.spm.tools.shoot.norm.data.subjs.deformations = {
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05468/y_rwsPR05468_BC220963-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05470/y_rwsPR05470_AMP_sub07-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05475/y_rwsPR05475_BP250490-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05476/y_rwsPR05476_AMP_sub08-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05478/y_rwsPR05478_MP210591-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05487/y_rwsPR05487_TS230991-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05488/y_rwsPR05488_JF160665-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05491/y_rwsPR05491_BD060172-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05513/y_rwsPR05513_RT040889-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05517/y_rwsPR05517_DS070360-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05525/y_rwsPR05525_NB101091-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05539/y_rwsPR05539_WD010441-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05548/y_rwsPR05548_QR101293-0010-00001-000176-01_A_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05549/y_rwsPR05549_RO010195-0010-00001-000176-01_A_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05556/y_rwsPR05556_TL080781-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05562/y_rwsPR05562_ML270349-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05565/y_rwsPR05565_AMP_sub18-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05566/y_rwsPR05566_TP020596-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05568/y_rwsPR05568_YB240158-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05602/y_rwsPR05602_DS140990-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05604/y_rwsPR05604_CC270493-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05616/y_rwsPR05616_VB090787-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05656/y_rwsPR05656_DB220996-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05660/y_rwsPR05660_LS220198-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05664/y_rwsPR05664_PV010890-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05667/y_rwsPR05667_AP100458-0011-00001-000176-01_Template.nii'
                                                               };

matlabbatch{3}.spm.tools.shoot.norm.data.subjs.images = {
                                                         {
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/MNIcoregaftershoot_Space/rwrPR05468_probabilistic_map_exclude_GB.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/MNIcoregaftershoot_Space/rwrPR05470_probabilistic_map_exclude_GB.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/MNIcoregaftershoot_Space/rwrPR05475_probabilistic_map_exclude_GB.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/MNIcoregaftershoot_Space/rwrPR05476_probabilistic_map_exclude_GB.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/MNIcoregaftershoot_Space/rwrPR05478_probabilistic_map_exclude_GB.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/MNIcoregaftershoot_Space/rwrPR05487_probabilistic_map_exclude_GB.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/MNIcoregaftershoot_Space/rwrPR05488_probabilistic_map_exclude_GB.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/MNIcoregaftershoot_Space/rwrPR05491_probabilistic_map_exclude_GB.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/MNIcoregaftershoot_Space/rwrPR05513_probabilistic_map_exclude_GB.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/MNIcoregaftershoot_Space/rwrPR05517_probabilistic_map_exclude_GB.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/MNIcoregaftershoot_Space/rwrPR05525_probabilistic_map_exclude_GB.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/MNIcoregaftershoot_Space/rwrPR05539_probabilistic_map_exclude_GB.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/MNIcoregaftershoot_Space/rwrPR05548_probabilistic_map_exclude_GB.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/MNIcoregaftershoot_Space/rwrPR05549_probabilistic_map_exclude_GB.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/MNIcoregaftershoot_Space/rwrPR05556_probabilistic_map_exclude_GB.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/MNIcoregaftershoot_Space/rwrPR05562_probabilistic_map_exclude_GB.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/MNIcoregaftershoot_Space/rwrPR05565_probabilistic_map_exclude_GB.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/MNIcoregaftershoot_Space/rwrPR05566_probabilistic_map_exclude_GB.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/MNIcoregaftershoot_Space/rwrPR05568_probabilistic_map_exclude_GB.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/MNIcoregaftershoot_Space/rwrPR05602_probabilistic_map_exclude_GB.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/MNIcoregaftershoot_Space/rwrPR05604_probabilistic_map_exclude_GB.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/MNIcoregaftershoot_Space/rwrPR05616_probabilistic_map_exclude_GB.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/MNIcoregaftershoot_Space/rwrPR05656_probabilistic_map_exclude_GB.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/MNIcoregaftershoot_Space/rwrPR05660_probabilistic_map_exclude_GB.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/MNIcoregaftershoot_Space/rwrPR05664_probabilistic_map_exclude_GB.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_processing/MNIcoregaftershoot_Space/rwrPR05667_probabilistic_map_exclude_GB.nii'
                                                         }
                                                         }';
matlabbatch{3}.spm.tools.shoot.norm.vox = [1 1 1];
matlabbatch{3}.spm.tools.shoot.norm.bb = [NaN NaN NaN
                                          NaN NaN NaN];
matlabbatch{3}.spm.tools.shoot.norm.preserve = 0;
matlabbatch{3}.spm.tools.shoot.norm.fwhm = 0;
%% %%%%%%%%%
%% 30th Jan 2025 MNI -> native with iy_
matlabbatch{1}.spm.spatial.normalise.write.subj(1).def = {'/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05468/iy_sPR05468_BC220963-0011-00001-000176-01.nii'};
matlabbatch{1}.spm.spatial.normalise.write.subj(1).resample = {'/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05468/otsu_binarized_image.nii,1'};
matlabbatch{1}.spm.spatial.normalise.write.subj(2).def = {'/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05470/iy_sPR05470_AMP_sub07-0002-00001-000176-01.nii'};
matlabbatch{1}.spm.spatial.normalise.write.subj(2).resample = {'/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05470/otsu_binarized_image.nii,1'};
matlabbatch{1}.spm.spatial.normalise.write.subj(3).def = {'/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05475/iy_sPR05475_BP250490-0011-00001-000176-01.nii'};
matlabbatch{1}.spm.spatial.normalise.write.subj(3).resample = {'/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05475/otsu_binarized_image.nii,1'};
matlabbatch{1}.spm.spatial.normalise.write.subj(4).def = {'/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05476/iy_sPR05476_AMP_sub08-0002-00001-000176-01.nii'};
matlabbatch{1}.spm.spatial.normalise.write.subj(4).resample = {'/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05476/otsu_binarized_image.nii,1'};
matlabbatch{1}.spm.spatial.normalise.write.subj(5).def = {'/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05478/iy_sPR05478_MP210591-0011-00001-000176-01.nii'};
matlabbatch{1}.spm.spatial.normalise.write.subj(5).resample = {'/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05478/otsu_binarized_image.nii,1'};
matlabbatch{1}.spm.spatial.normalise.write.subj(6).def = {'/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05487/iy_sPR05487_TS230991-0002-00001-000176-01.nii'};
matlabbatch{1}.spm.spatial.normalise.write.subj(6).resample = {'/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05487/otsu_binarized_image.nii,1'};
matlabbatch{1}.spm.spatial.normalise.write.subj(7).def = {'/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05488/iy_sPR05488_JF160665-0011-00001-000176-01.nii'};
matlabbatch{1}.spm.spatial.normalise.write.subj(7).resample = {'/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05488/otsu_binarized_image.nii,1'};
matlabbatch{1}.spm.spatial.normalise.write.subj(8).def = {'/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05491/iy_sPR05491_BD060172-0002-00001-000176-01.nii'};
matlabbatch{1}.spm.spatial.normalise.write.subj(8).resample = {'/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05491/otsu_binarized_image.nii,1'};
matlabbatch{1}.spm.spatial.normalise.write.subj(9).def = {'/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05513/iy_sPR05513_RT040889-0011-00001-000176-01.nii'};
matlabbatch{1}.spm.spatial.normalise.write.subj(9).resample = {'/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05513/otsu_binarized_image.nii,1'};
matlabbatch{1}.spm.spatial.normalise.write.subj(10).def = {'/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05517/iy_sPR05517_DS070360-0002-00001-000176-01.nii'};
matlabbatch{1}.spm.spatial.normalise.write.subj(10).resample = {'/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05517/otsu_binarized_image.nii,1'};
matlabbatch{1}.spm.spatial.normalise.write.subj(11).def = {'/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05525/iy_sPR05525_NB101091-0011-00001-000176-01.nii'};
matlabbatch{1}.spm.spatial.normalise.write.subj(11).resample = {'/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05525/otsu_binarized_image.nii,1'};
matlabbatch{1}.spm.spatial.normalise.write.subj(12).def = {'/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05539/iy_sPR05539_WD010441-0011-00001-000176-01.nii'};
matlabbatch{1}.spm.spatial.normalise.write.subj(12).resample = {'/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05539/otsu_binarized_image.nii,1'};
matlabbatch{1}.spm.spatial.normalise.write.subj(13).def = {'/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05548/iy_sPR05548_QR101293-0010-00001-000176-01_A.nii'};
matlabbatch{1}.spm.spatial.normalise.write.subj(13).resample = {'/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05548/otsu_binarized_image.nii,1'};
matlabbatch{1}.spm.spatial.normalise.write.subj(14).def = {'/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05549/iy_sPR05549_RO010195-0010-00001-000176-01_A.nii'};
matlabbatch{1}.spm.spatial.normalise.write.subj(14).resample = {'/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05549/otsu_binarized_image.nii,1'};
matlabbatch{1}.spm.spatial.normalise.write.subj(15).def = {'/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05556/iy_sPR05556_TL080781-0002-00001-000176-01.nii'};
matlabbatch{1}.spm.spatial.normalise.write.subj(15).resample = {'/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05556/otsu_binarized_image.nii,1'};
matlabbatch{1}.spm.spatial.normalise.write.subj(16).def = {'/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05562/iy_sPR05562_ML270349-0011-00001-000176-01.nii'};
matlabbatch{1}.spm.spatial.normalise.write.subj(16).resample = {'/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05562/otsu_binarized_image.nii,1'};
matlabbatch{1}.spm.spatial.normalise.write.subj(17).def = {'/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05565/iy_sPR05565_AMP_sub18-0002-00001-000176-01.nii'};
matlabbatch{1}.spm.spatial.normalise.write.subj(17).resample = {'/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05565/otsu_binarized_image.nii,1'};
matlabbatch{1}.spm.spatial.normalise.write.subj(18).def = {'/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05566/iy_sPR05566_TP020596-0011-00001-000176-01.nii'};
matlabbatch{1}.spm.spatial.normalise.write.subj(18).resample = {'/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05566/otsu_binarized_image.nii,1'};
matlabbatch{1}.spm.spatial.normalise.write.subj(19).def = {'/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05568/iy_sPR05568_YB240158-0011-00001-000176-01.nii'};
matlabbatch{1}.spm.spatial.normalise.write.subj(19).resample = {'/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05568/otsu_binarized_image.nii,1'};
matlabbatch{1}.spm.spatial.normalise.write.subj(20).def = {'/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05602/iy_sPR05602_DS140990-0011-00001-000176-01.nii'};
matlabbatch{1}.spm.spatial.normalise.write.subj(20).resample = {'/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05602/otsu_binarized_image.nii,1'};
matlabbatch{1}.spm.spatial.normalise.write.subj(21).def = {'/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05604/iy_sPR05604_CC270493-0011-00001-000176-01.nii'};
matlabbatch{1}.spm.spatial.normalise.write.subj(21).resample = {'/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05604/otsu_binarized_image.nii,1'};
matlabbatch{1}.spm.spatial.normalise.write.subj(22).def = {'/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05616/iy_sPR05616_VB090787-0011-00001-000176-01.nii'};
matlabbatch{1}.spm.spatial.normalise.write.subj(22).resample = {'/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05616/otsu_binarized_image.nii,1'};
matlabbatch{1}.spm.spatial.normalise.write.subj(23).def = {'/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05656/iy_sPR05656_DB220996-0011-00001-000176-01.nii'};
matlabbatch{1}.spm.spatial.normalise.write.subj(23).resample = {'/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05656/otsu_binarized_image.nii,1'};
matlabbatch{1}.spm.spatial.normalise.write.subj(24).def = {'/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05660/iy_sPR05660_LS220198-0002-00001-000176-01.nii'};
matlabbatch{1}.spm.spatial.normalise.write.subj(24).resample = {'/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05660/otsu_binarized_image.nii,1'};
matlabbatch{1}.spm.spatial.normalise.write.subj(25).def = {'/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05664/iy_sPR05664_PV010890-0011-00001-000176-01.nii'};
matlabbatch{1}.spm.spatial.normalise.write.subj(25).resample = {'/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05664/otsu_binarized_image.nii,1'};
matlabbatch{1}.spm.spatial.normalise.write.subj(26).def = {'/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05667/iy_sPR05667_AP100458-0011-00001-000176-01.nii'};
matlabbatch{1}.spm.spatial.normalise.write.subj(26).resample = {'/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05667/otsu_binarized_image.nii,1'};
matlabbatch{1}.spm.spatial.normalise.write.woptions.bb = [-78 -112 -70
                                                          78 76 85];
matlabbatch{1}.spm.spatial.normalise.write.woptions.vox = [1 1 1];
matlabbatch{1}.spm.spatial.normalise.write.woptions.interp = 0;
matlabbatch{1}.spm.spatial.normalise.write.woptions.prefix = 'w';

%% Creating a LC / other brain stem neuromorphometric labels
%First co-registration
%Then Run Shoot (existing Templates)
%Then do Normalise: Estimate with y_deformation field
%Then multiply with brainstem label _c1, _c2, _c3.


%% Creating LC-TPM
%4D to 3D
matlabbatch{1}.spm.util.split.vol = {'/Users/Olechka/spm-main/tpm/enhanced_TPM.nii,1'};
matlabbatch{1}.spm.util.split.outdir = {'/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_TPMs'};
%Python: resampled TPMs
%creating from a 3D file a 4D file
matlabbatch{1}.spm.util.cat.vols = {
                                    '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_TPMs/Betts_TPM/adjusted_TPM_00001.nii,1'
                                    '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_TPMs/Betts_TPM/adjusted_TPM_00002.nii,1'
                                    '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_TPMs/Betts_TPM/adjusted_TPM_00003.nii,1'
                                    '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_TPMs/Betts_TPM/adjusted_TPM_00004.nii,1'
                                    '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_TPMs/Betts_TPM/adjusted_TPM_00005.nii,1'
                                    '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_TPMs/Betts_TPM/adjusted_TPM_00006.nii,1'
                                    '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_TPMs/Betts_TPM/adjusted_TPM_00007.nii,1'
                                    };
matlabbatch{1}.spm.util.cat.name = 'Betts_TPM_4D.nii';
matlabbatch{1}.spm.util.cat.dtype = 0;
matlabbatch{1}.spm.util.cat.RT = NaN;
matlabbatch{2}.spm.util.cat.vols = {
                                    '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_TPMs/Dahl_TPM/adjusted_TPM_00001.nii,1'
                                    '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_TPMs/Dahl_TPM/adjusted_TPM_00002.nii,1'
                                    '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_TPMs/Dahl_TPM/adjusted_TPM_00003.nii,1'
                                    '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_TPMs/Dahl_TPM/adjusted_TPM_00004.nii,1'
                                    '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_TPMs/Dahl_TPM/adjusted_TPM_00005.nii,1'
                                    '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_TPMs/Dahl_TPM/adjusted_TPM_00006.nii,1'
                                    '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_TPMs/Dahl_TPM/adjusted_TPM_00007.nii,1'
                                    };
matlabbatch{2}.spm.util.cat.name = 'Dahl_TPM_4D.nii';
matlabbatch{2}.spm.util.cat.dtype = 0;
matlabbatch{2}.spm.util.cat.RT = NaN;
matlabbatch{3}.spm.util.cat.vols = {
                                    '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_TPMs/Keren_TPM/adjusted_TPM_00001.nii,1'
                                    '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_TPMs/Keren_TPM/adjusted_TPM_00002.nii,1'
                                    '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_TPMs/Keren_TPM/adjusted_TPM_00003.nii,1'
                                    '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_TPMs/Keren_TPM/adjusted_TPM_00004.nii,1'
                                    '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_TPMs/Keren_TPM/adjusted_TPM_00005.nii,1'
                                    '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_TPMs/Keren_TPM/adjusted_TPM_00006.nii,1'
                                    '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_TPMs/Keren_TPM/adjusted_TPM_00007.nii,1'
                                    };
matlabbatch{3}.spm.util.cat.name = 'Keren_TPM_4D.nii';
matlabbatch{3}.spm.util.cat.dtype = 0;
matlabbatch{3}.spm.util.cat.RT = NaN;
matlabbatch{4}.spm.util.cat.vols = {
                                    '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_TPMs/LREN_TPM/adjusted_TPM_00001.nii,1'
                                    '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_TPMs/LREN_TPM/adjusted_TPM_00002.nii,1'
                                    '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_TPMs/LREN_TPM/adjusted_TPM_00003.nii,1'
                                    '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_TPMs/LREN_TPM/adjusted_TPM_00004.nii,1'
                                    '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_TPMs/LREN_TPM/adjusted_TPM_00005.nii,1'
                                    '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_TPMs/LREN_TPM/adjusted_TPM_00006.nii,1'
                                    '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_TPMs/LREN_TPM/adjusted_TPM_00007.nii,1'
                                    };
matlabbatch{4}.spm.util.cat.name = 'LREN_TPM_4D.nii';
matlabbatch{4}.spm.util.cat.dtype = 0;
matlabbatch{4}.spm.util.cat.RT = NaN;
matlabbatch{5}.spm.util.cat.vols = {
                                    '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_TPMs/Lee_TPM/adjusted_TPM_00001.nii,1'
                                    '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_TPMs/Lee_TPM/adjusted_TPM_00002.nii,1'
                                    '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_TPMs/Lee_TPM/adjusted_TPM_00003.nii,1'
                                    '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_TPMs/Lee_TPM/adjusted_TPM_00004.nii,1'
                                    '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_TPMs/Lee_TPM/adjusted_TPM_00005.nii,1'
                                    '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_TPMs/Lee_TPM/adjusted_TPM_00006.nii,1'
                                    '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_TPMs/Lee_TPM/adjusted_TPM_00007.nii,1'
                                    };
matlabbatch{5}.spm.util.cat.name = 'Lee_TPM_4D.nii';
matlabbatch{5}.spm.util.cat.dtype = 0;
matlabbatch{5}.spm.util.cat.RT = NaN;
matlabbatch{6}.spm.util.cat.vols = {
                                    '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_TPMs/Liu_TPM/adjusted_TPM_00001.nii,1'
                                    '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_TPMs/Liu_TPM/adjusted_TPM_00002.nii,1'
                                    '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_TPMs/Liu_TPM/adjusted_TPM_00003.nii,1'
                                    '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_TPMs/Liu_TPM/adjusted_TPM_00004.nii,1'
                                    '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_TPMs/Liu_TPM/adjusted_TPM_00005.nii,1'
                                    '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_TPMs/Liu_TPM/adjusted_TPM_00006.nii,1'
                                    '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_TPMs/Liu_TPM/adjusted_TPM_00007.nii,1'
                                    };
matlabbatch{6}.spm.util.cat.name = 'Liu_TPM_4D.nii';
matlabbatch{6}.spm.util.cat.dtype = 0;
matlabbatch{6}.spm.util.cat.RT = NaN;
matlabbatch{7}.spm.util.cat.vols = {
                                    '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_TPMs/Tona_TPM/adjusted_TPM_00001.nii,1'
                                    '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_TPMs/Tona_TPM/adjusted_TPM_00002.nii,1'
                                    '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_TPMs/Tona_TPM/adjusted_TPM_00003.nii,1'
                                    '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_TPMs/Tona_TPM/adjusted_TPM_00004.nii,1'
                                    '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_TPMs/Tona_TPM/adjusted_TPM_00005.nii,1'
                                    '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_TPMs/Tona_TPM/adjusted_TPM_00006.nii,1'
                                    '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_TPMs/Tona_TPM/adjusted_TPM_00007.nii,1'
                                    };
matlabbatch{7}.spm.util.cat.name = 'Tona_TPM_4D.nii';
matlabbatch{7}.spm.util.cat.dtype = 0;
matlabbatch{7}.spm.util.cat.RT = NaN;
matlabbatch{8}.spm.util.cat.vols = {
                                    '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_TPMs/Ye_TPM/adjusted_TPM_00001.nii,1'
                                    '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_TPMs/Ye_TPM/adjusted_TPM_00002.nii,1'
                                    '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_TPMs/Ye_TPM/adjusted_TPM_00003.nii,1'
                                    '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_TPMs/Ye_TPM/adjusted_TPM_00004.nii,1'
                                    '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_TPMs/Ye_TPM/adjusted_TPM_00005.nii,1'
                                    '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_TPMs/Ye_TPM/adjusted_TPM_00006.nii,1'
                                    '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_TPMs/Ye_TPM/adjusted_TPM_00007.nii,1'
                                    };
matlabbatch{8}.spm.util.cat.name = 'Ye_TPM_4D.nii';
matlabbatch{8}.spm.util.cat.dtype = 0

%% Bring results from native to MNI space (here only label and updated manual segm)
matlabbatch{1}.spm.tools.shoot.norm.template = {'/Volumes/OlgaDrive/PhD/Label/training_data/Template_4.nii'};
matlabbatch{1}.spm.tools.shoot.norm.data.subjs.deformations = {
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05468/y_rc1sPR05468_BC220963-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05470/y_rc1sPR05470_AMP_sub07-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05475/y_rc1sPR05475_BP250490-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05476/y_rc1sPR05476_AMP_sub08-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05478/y_rc1sPR05478_MP210591-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05487/y_rc1sPR05487_TS230991-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05488/y_rc1sPR05488_JF160665-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05491/y_rc1sPR05491_BD060172-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05513/y_rc1sPR05513_RT040889-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05517/y_rc1sPR05517_DS070360-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05525/y_rc1sPR05525_NB101091-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05539/y_rc1sPR05539_WD010441-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05556/y_rc1sPR05556_TL080781-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05562/y_rc1sPR05562_ML270349-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05565/y_rc1sPR05565_AMP_sub18-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05566/y_rc1sPR05566_TP020596-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05568/y_rc1sPR05568_YB240158-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05602/y_rc1sPR05602_DS140990-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05604/y_rc1sPR05604_CC270493-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05616/y_rc1sPR05616_VB090787-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05656/y_rc1sPR05656_DB220996-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05660/y_rc1sPR05660_LS220198-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05664/y_rc1sPR05664_PV010890-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05667/y_rc1sPR05667_AP100458-0011-00001-000176-01_Template.nii'
                                                               };

matlabbatch{1}.spm.tools.shoot.norm.data.subjs.images = {
                                                         {
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_updateproc/PR05468/coreg_MajorityVote_PR05468.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_updateproc/PR05470/coreg_MajorityVote_PR05470.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_updateproc/PR05475/coreg_MajorityVote_PR05475.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_updateproc/PR05476/coreg_MajorityVote_PR05476.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_updateproc/PR05478/coreg_MajorityVote_PR05478.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_updateproc/PR05487/coreg_MajorityVote_PR05487.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_updateproc/PR05488/coreg_MajorityVote_PR05488.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_updateproc/PR05491/coreg_MajorityVote_PR05491.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_updateproc/PR05513/coreg_MajorityVote_PR05513.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_updateproc/PR05517/coreg_MajorityVote_PR05517.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_updateproc/PR05525/coreg_MajorityVote_PR05525.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_updateproc/PR05539/coreg_MajorityVote_PR05539.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_updateproc/PR05556/coreg_MajorityVote_PR05556.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_updateproc/PR05562/coreg_MajorityVote_PR05562.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_updateproc/PR05565/coreg_MajorityVote_PR05565.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_updateproc/PR05566/coreg_MajorityVote_PR05566.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_updateproc/PR05568/coreg_MajorityVote_PR05568.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_updateproc/PR05602/coreg_MajorityVote_PR05602.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_updateproc/PR05604/coreg_MajorityVote_PR05604.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_updateproc/PR05616/coreg_MajorityVote_PR05616.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_updateproc/PR05656/coreg_MajorityVote_PR05656.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_updateproc/PR05660/coreg_MajorityVote_PR05660.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_updateproc/PR05664/coreg_MajorityVote_PR05664.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/ManSeg_updateproc/PR05667/coreg_MajorityVote_PR05667.nii'
                                                         }
                                                         {
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05468/AVEraged_LC_label_sPR05468_BC220963-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05470/AVEraged_LC_label_sPR05470_AMP_sub07-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05475/AVEraged_LC_label_sPR05475_BP250490-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05476/AVEraged_LC_label_sPR05476_AMP_sub08-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05478/AVEraged_LC_label_sPR05478_MP210591-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05487/AVEraged_LC_label_sPR05487_TS230991-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05488/AVEraged_LC_label_sPR05488_JF160665-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05491/AVEraged_LC_label_sPR05491_BD060172-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05513/AVEraged_LC_label_sPR05513_RT040889-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05517/AVEraged_LC_label_sPR05517_DS070360-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05525/AVEraged_LC_label_sPR05525_NB101091-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05539/AVEraged_LC_label_sPR05539_WD010441-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05556/AVEraged_LC_label_sPR05556_TL080781-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05562/AVEraged_LC_label_sPR05562_ML270349-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05565/AVEraged_LC_label_sPR05565_AMP_sub18-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05566/AVEraged_LC_label_sPR05566_TP020596-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05568/AVEraged_LC_label_sPR05568_YB240158-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05602/AVEraged_LC_label_sPR05602_DS140990-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05604/AVEraged_LC_label_sPR05604_CC270493-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05616/AVEraged_LC_label_sPR05616_VB090787-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05656/AVEraged_LC_label_sPR05656_DB220996-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05660/AVEraged_LC_label_sPR05660_LS220198-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05664/AVEraged_LC_label_sPR05664_PV010890-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05667/AVEraged_LC_label_sPR05667_AP100458-0011-00001-000176-01.nii'
                                                         }
                                                         {
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05468/Betts_LC_label_sPR05468_BC220963-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05470/Betts_LC_label_sPR05470_AMP_sub07-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05475/Betts_LC_label_sPR05475_BP250490-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05476/Betts_LC_label_sPR05476_AMP_sub08-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05478/Betts_LC_label_sPR05478_MP210591-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05487/Betts_LC_label_sPR05487_TS230991-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05488/Betts_LC_label_sPR05488_JF160665-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05491/Betts_LC_label_sPR05491_BD060172-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05513/Betts_LC_label_sPR05513_RT040889-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05517/Betts_LC_label_sPR05517_DS070360-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05525/Betts_LC_label_sPR05525_NB101091-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05539/Betts_LC_label_sPR05539_WD010441-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05556/Betts_LC_label_sPR05556_TL080781-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05562/Betts_LC_label_sPR05562_ML270349-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05565/Betts_LC_label_sPR05565_AMP_sub18-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05566/Betts_LC_label_sPR05566_TP020596-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05568/Betts_LC_label_sPR05568_YB240158-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05602/Betts_LC_label_sPR05602_DS140990-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05604/Betts_LC_label_sPR05604_CC270493-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05616/Betts_LC_label_sPR05616_VB090787-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05656/Betts_LC_label_sPR05656_DB220996-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05660/Betts_LC_label_sPR05660_LS220198-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05664/Betts_LC_label_sPR05664_PV010890-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05667/Betts_LC_label_sPR05667_AP100458-0011-00001-000176-01.nii'
                                                         }
                                                         {
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05468/Lee_LC_label_sPR05468_BC220963-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05470/Lee_LC_label_sPR05470_AMP_sub07-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05475/Lee_LC_label_sPR05475_BP250490-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05476/Lee_LC_label_sPR05476_AMP_sub08-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05478/Lee_LC_label_sPR05478_MP210591-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05487/Lee_LC_label_sPR05487_TS230991-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05488/Lee_LC_label_sPR05488_JF160665-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05491/Lee_LC_label_sPR05491_BD060172-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05513/Lee_LC_label_sPR05513_RT040889-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05517/Lee_LC_label_sPR05517_DS070360-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05525/Lee_LC_label_sPR05525_NB101091-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05539/Lee_LC_label_sPR05539_WD010441-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05556/Lee_LC_label_sPR05556_TL080781-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05562/Lee_LC_label_sPR05562_ML270349-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05565/Lee_LC_label_sPR05565_AMP_sub18-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05566/Lee_LC_label_sPR05566_TP020596-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05568/Lee_LC_label_sPR05568_YB240158-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05602/Lee_LC_label_sPR05602_DS140990-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05604/Lee_LC_label_sPR05604_CC270493-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05616/Lee_LC_label_sPR05616_VB090787-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05656/Lee_LC_label_sPR05656_DB220996-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05660/Lee_LC_label_sPR05660_LS220198-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05664/Lee_LC_label_sPR05664_PV010890-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05667/Lee_LC_label_sPR05667_AP100458-0011-00001-000176-01.nii'
                                                         }
                                                         {
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05468/Liu_LC_label_sPR05468_BC220963-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05470/Liu_LC_label_sPR05470_AMP_sub07-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05475/Liu_LC_label_sPR05475_BP250490-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05476/Liu_LC_label_sPR05476_AMP_sub08-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05478/Liu_LC_label_sPR05478_MP210591-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05487/Liu_LC_label_sPR05487_TS230991-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05488/Liu_LC_label_sPR05488_JF160665-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05491/Liu_LC_label_sPR05491_BD060172-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05513/Liu_LC_label_sPR05513_RT040889-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05517/Liu_LC_label_sPR05517_DS070360-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05525/Liu_LC_label_sPR05525_NB101091-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05539/Liu_LC_label_sPR05539_WD010441-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05556/Liu_LC_label_sPR05556_TL080781-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05562/Liu_LC_label_sPR05562_ML270349-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05565/Liu_LC_label_sPR05565_AMP_sub18-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05566/Liu_LC_label_sPR05566_TP020596-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05568/Liu_LC_label_sPR05568_YB240158-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05602/Liu_LC_label_sPR05602_DS140990-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05604/Liu_LC_label_sPR05604_CC270493-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05616/Liu_LC_label_sPR05616_VB090787-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05656/Liu_LC_label_sPR05656_DB220996-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05660/Liu_LC_label_sPR05660_LS220198-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05664/Liu_LC_label_sPR05664_PV010890-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05667/Liu_LC_label_sPR05667_AP100458-0011-00001-000176-01.nii'
                                                         }
                                                         {
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05468/Dahl_LC_label_sPR05468_BC220963-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05470/Dahl_LC_label_sPR05470_AMP_sub07-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05475/Dahl_LC_label_sPR05475_BP250490-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05476/Dahl_LC_label_sPR05476_AMP_sub08-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05478/Dahl_LC_label_sPR05478_MP210591-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05487/Dahl_LC_label_sPR05487_TS230991-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05488/Dahl_LC_label_sPR05488_JF160665-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05491/Dahl_LC_label_sPR05491_BD060172-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05513/Dahl_LC_label_sPR05513_RT040889-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05517/Dahl_LC_label_sPR05517_DS070360-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05525/Dahl_LC_label_sPR05525_NB101091-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05539/Dahl_LC_label_sPR05539_WD010441-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05556/Dahl_LC_label_sPR05556_TL080781-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05562/Dahl_LC_label_sPR05562_ML270349-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05565/Dahl_LC_label_sPR05565_AMP_sub18-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05566/Dahl_LC_label_sPR05566_TP020596-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05568/Dahl_LC_label_sPR05568_YB240158-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05602/Dahl_LC_label_sPR05602_DS140990-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05604/Dahl_LC_label_sPR05604_CC270493-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05616/Dahl_LC_label_sPR05616_VB090787-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05656/Dahl_LC_label_sPR05656_DB220996-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05660/Dahl_LC_label_sPR05660_LS220198-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05664/Dahl_LC_label_sPR05664_PV010890-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05667/Dahl_LC_label_sPR05667_AP100458-0011-00001-000176-01.nii'
                                                         }
                                                         {
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05468/Olga_LC_label_sPR05468_BC220963-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05470/Olga_LC_label_sPR05470_AMP_sub07-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05475/Olga_LC_label_sPR05475_BP250490-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05476/Olga_LC_label_sPR05476_AMP_sub08-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05478/Olga_LC_label_sPR05478_MP210591-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05487/Olga_LC_label_sPR05487_TS230991-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05488/Olga_LC_label_sPR05488_JF160665-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05491/Olga_LC_label_sPR05491_BD060172-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05513/Olga_LC_label_sPR05513_RT040889-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05517/Olga_LC_label_sPR05517_DS070360-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05525/Olga_LC_label_sPR05525_NB101091-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05539/Olga_LC_label_sPR05539_WD010441-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05556/Olga_LC_label_sPR05556_TL080781-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05562/Olga_LC_label_sPR05562_ML270349-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05565/Olga_LC_label_sPR05565_AMP_sub18-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05566/Olga_LC_label_sPR05566_TP020596-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05568/Olga_LC_label_sPR05568_YB240158-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05602/Olga_LC_label_sPR05602_DS140990-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05604/Olga_LC_label_sPR05604_CC270493-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05616/Olga_LC_label_sPR05616_VB090787-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05656/Olga_LC_label_sPR05656_DB220996-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05660/Olga_LC_label_sPR05660_LS220198-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05664/Olga_LC_label_sPR05664_PV010890-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05667/Olga_LC_label_sPR05667_AP100458-0011-00001-000176-01.nii'
                                                         }
                                                         {
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05468/Ye_LC_label_sPR05468_BC220963-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05470/Ye_LC_label_sPR05470_AMP_sub07-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05475/Ye_LC_label_sPR05475_BP250490-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05476/Ye_LC_label_sPR05476_AMP_sub08-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05478/Ye_LC_label_sPR05478_MP210591-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05487/Ye_LC_label_sPR05487_TS230991-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05488/Ye_LC_label_sPR05488_JF160665-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05491/Ye_LC_label_sPR05491_BD060172-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05513/Ye_LC_label_sPR05513_RT040889-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05517/Ye_LC_label_sPR05517_DS070360-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05525/Ye_LC_label_sPR05525_NB101091-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05539/Ye_LC_label_sPR05539_WD010441-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05556/Ye_LC_label_sPR05556_TL080781-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05562/Ye_LC_label_sPR05562_ML270349-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05565/Ye_LC_label_sPR05565_AMP_sub18-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05566/Ye_LC_label_sPR05566_TP020596-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05568/Ye_LC_label_sPR05568_YB240158-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05602/Ye_LC_label_sPR05602_DS140990-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05604/Ye_LC_label_sPR05604_CC270493-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05616/Ye_LC_label_sPR05616_VB090787-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05656/Ye_LC_label_sPR05656_DB220996-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05660/Ye_LC_label_sPR05660_LS220198-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05664/Ye_LC_label_sPR05664_PV010890-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05667/Ye_LC_label_sPR05667_AP100458-0011-00001-000176-01.nii'
                                                         }
                                                         {
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05468/Eckert_LC_label_sPR05468_BC220963-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05470/Eckert_LC_label_sPR05470_AMP_sub07-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05475/Eckert_LC_label_sPR05475_BP250490-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05476/Eckert_LC_label_sPR05476_AMP_sub08-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05478/Eckert_LC_label_sPR05478_MP210591-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05487/Eckert_LC_label_sPR05487_TS230991-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05488/Eckert_LC_label_sPR05488_JF160665-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05491/Eckert_LC_label_sPR05491_BD060172-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05513/Eckert_LC_label_sPR05513_RT040889-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05517/Eckert_LC_label_sPR05517_DS070360-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05525/Eckert_LC_label_sPR05525_NB101091-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05539/Eckert_LC_label_sPR05539_WD010441-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05556/Eckert_LC_label_sPR05556_TL080781-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05562/Eckert_LC_label_sPR05562_ML270349-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05565/Eckert_LC_label_sPR05565_AMP_sub18-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05566/Eckert_LC_label_sPR05566_TP020596-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05568/Eckert_LC_label_sPR05568_YB240158-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05602/Eckert_LC_label_sPR05602_DS140990-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05604/Eckert_LC_label_sPR05604_CC270493-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05616/Eckert_LC_label_sPR05616_VB090787-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05656/Eckert_LC_label_sPR05656_DB220996-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05660/Eckert_LC_label_sPR05660_LS220198-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05664/Eckert_LC_label_sPR05664_PV010890-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05667/Eckert_LC_label_sPR05667_AP100458-0011-00001-000176-01.nii'
                                                         }
                                                         {
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05468/Tona_LC_label_left_sPR05468_BC220963-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05470/Tona_LC_label_left_sPR05470_AMP_sub07-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05475/Tona_LC_label_left_sPR05475_BP250490-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05476/Tona_LC_label_left_sPR05476_AMP_sub08-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05478/Tona_LC_label_left_sPR05478_MP210591-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05487/Tona_LC_label_left_sPR05487_TS230991-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05488/Tona_LC_label_left_sPR05488_JF160665-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05491/Tona_LC_label_left_sPR05491_BD060172-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05513/Tona_LC_label_left_sPR05513_RT040889-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05517/Tona_LC_label_left_sPR05517_DS070360-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05525/Tona_LC_label_left_sPR05525_NB101091-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05539/Tona_LC_label_left_sPR05539_WD010441-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05556/Tona_LC_label_left_sPR05556_TL080781-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05562/Tona_LC_label_left_sPR05562_ML270349-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05565/Tona_LC_label_left_sPR05565_AMP_sub18-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05566/Tona_LC_label_left_sPR05566_TP020596-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05568/Tona_LC_label_left_sPR05568_YB240158-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05602/Tona_LC_label_left_sPR05602_DS140990-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05604/Tona_LC_label_left_sPR05604_CC270493-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05616/Tona_LC_label_left_sPR05616_VB090787-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05656/Tona_LC_label_left_sPR05656_DB220996-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05660/Tona_LC_label_left_sPR05660_LS220198-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05664/Tona_LC_label_left_sPR05664_PV010890-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05667/Tona_LC_label_left_sPR05667_AP100458-0011-00001-000176-01.nii'
                                                         }
                                                         {
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05468/Tona_LC_label_right_sPR05468_BC220963-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05470/Tona_LC_label_right_sPR05470_AMP_sub07-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05475/Tona_LC_label_right_sPR05475_BP250490-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05476/Tona_LC_label_right_sPR05476_AMP_sub08-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05478/Tona_LC_label_right_sPR05478_MP210591-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05487/Tona_LC_label_right_sPR05487_TS230991-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05488/Tona_LC_label_right_sPR05488_JF160665-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05491/Tona_LC_label_right_sPR05491_BD060172-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05513/Tona_LC_label_right_sPR05513_RT040889-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05517/Tona_LC_label_right_sPR05517_DS070360-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05525/Tona_LC_label_right_sPR05525_NB101091-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05539/Tona_LC_label_right_sPR05539_WD010441-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05556/Tona_LC_label_right_sPR05556_TL080781-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05562/Tona_LC_label_right_sPR05562_ML270349-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05565/Tona_LC_label_right_sPR05565_AMP_sub18-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05566/Tona_LC_label_right_sPR05566_TP020596-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05568/Tona_LC_label_right_sPR05568_YB240158-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05602/Tona_LC_label_right_sPR05602_DS140990-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05604/Tona_LC_label_right_sPR05604_CC270493-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05616/Tona_LC_label_right_sPR05616_VB090787-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05656/Tona_LC_label_right_sPR05656_DB220996-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05660/Tona_LC_label_right_sPR05660_LS220198-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05664/Tona_LC_label_right_sPR05664_PV010890-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05667/Tona_LC_label_right_sPR05667_AP100458-0011-00001-000176-01.nii'
                                                         }
                                                         }';
matlabbatch{1}.spm.tools.shoot.norm.vox = [NaN NaN NaN];
matlabbatch{1}.spm.tools.shoot.norm.bb = [NaN NaN NaN
                                          NaN NaN NaN];
matlabbatch{1}.spm.tools.shoot.norm.preserve = 1;
matlabbatch{1}.spm.tools.shoot.norm.fwhm = 0;

%%%%%
%%
%Majority vote atlas native -> Neuromorph (after FLIRT)
matlabbatch{1}.spm.tools.shoot.norm.template = {'/Volumes/OlgaDrive/PhD/Label/training_data/Template_4.nii'};
matlabbatch{1}.spm.tools.shoot.norm.data.subjs.deformations = {
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05468/y_rc1sPR05468_BC220963-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05470/y_rc1sPR05470_AMP_sub07-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05475/y_rc1sPR05475_BP250490-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05476/y_rc1sPR05476_AMP_sub08-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05478/y_rc1sPR05478_MP210591-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05487/y_rc1sPR05487_TS230991-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05488/y_rc1sPR05488_JF160665-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05491/y_rc1sPR05491_BD060172-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05513/y_rc1sPR05513_RT040889-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05517/y_rc1sPR05517_DS070360-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05525/y_rc1sPR05525_NB101091-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05539/y_rc1sPR05539_WD010441-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05556/y_rc1sPR05556_TL080781-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05562/y_rc1sPR05562_ML270349-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05565/y_rc1sPR05565_AMP_sub18-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05566/y_rc1sPR05566_TP020596-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05568/y_rc1sPR05568_YB240158-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05602/y_rc1sPR05602_DS140990-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05604/y_rc1sPR05604_CC270493-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05616/y_rc1sPR05616_VB090787-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05656/y_rc1sPR05656_DB220996-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05660/y_rc1sPR05660_LS220198-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05664/y_rc1sPR05664_PV010890-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05667/y_rc1sPR05667_AP100458-0011-00001-000176-01_Template.nii'
                                                               };
matlabbatch{1}.spm.tools.shoot.norm.data.subjs.images = {
                                                         {
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/MajorityVoteFLIRT1mm/MajorityVote_PR05468_in_T1w_resampled.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/MajorityVoteFLIRT1mm/MajorityVote_PR05470_in_T1w_resampled.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/MajorityVoteFLIRT1mm/MajorityVote_PR05475_in_T1w_resampled.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/MajorityVoteFLIRT1mm/MajorityVote_PR05476_in_T1w_resampled.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/MajorityVoteFLIRT1mm/MajorityVote_PR05478_in_T1w_resampled.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/MajorityVoteFLIRT1mm/MajorityVote_PR05487_in_T1w_resampled.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/MajorityVoteFLIRT1mm/MajorityVote_PR05488_in_T1w_resampled.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/MajorityVoteFLIRT1mm/MajorityVote_PR05491_in_T1w_resampled.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/MajorityVoteFLIRT1mm/MajorityVote_PR05513_in_T1w_resampled.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/MajorityVoteFLIRT1mm/MajorityVote_PR05517_in_T1w_resampled.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/MajorityVoteFLIRT1mm/MajorityVote_PR05525_in_T1w_resampled.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/MajorityVoteFLIRT1mm/MajorityVote_PR05539_in_T1w_resampled.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/MajorityVoteFLIRT1mm/MajorityVote_PR05556_in_T1w_resampled.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/MajorityVoteFLIRT1mm/MajorityVote_PR05562_in_T1w_resampled.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/MajorityVoteFLIRT1mm/MajorityVote_PR05565_in_T1w_resampled.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/MajorityVoteFLIRT1mm/MajorityVote_PR05566_in_T1w_resampled.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/MajorityVoteFLIRT1mm/MajorityVote_PR05568_in_T1w_resampled.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/MajorityVoteFLIRT1mm/MajorityVote_PR05602_in_T1w_resampled.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/MajorityVoteFLIRT1mm/MajorityVote_PR05604_in_T1w_resampled.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/MajorityVoteFLIRT1mm/MajorityVote_PR05616_in_T1w_resampled.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/MajorityVoteFLIRT1mm/MajorityVote_PR05656_in_T1w_resampled.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/MajorityVoteFLIRT1mm/MajorityVote_PR05660_in_T1w_resampled.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/MajorityVoteFLIRT1mm/MajorityVote_PR05664_in_T1w_resampled.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/MajorityVoteFLIRT1mm/MajorityVote_PR05667_in_T1w_resampled.nii'
                                                         }
                                                         }';
matlabbatch{1}.spm.tools.shoot.norm.vox = [1 1 1];
matlabbatch{1}.spm.tools.shoot.norm.bb = [NaN NaN NaN
                                          NaN NaN NaN];
matlabbatch{1}.spm.tools.shoot.norm.preserve = 0;
matlabbatch{1}.spm.tools.shoot.norm.fwhm = 0;
%% create deformation fields to MNI space
matlabbatch{1}.spm.tools.shoot.warp.images = {
                                              {
                                              '/Users/Olechka/spm-main/tpm/enhanced_TPM.nii,1'
                                              '/Users/Olechka/spm-main/tpm/enhanced_TPM.nii,2'
                                              }
                                              }';
%% Apply to T1w images (problem with velocity field)
matlabbatch{1}.spm.tools.shoot.warp1.images = {
                                               {
                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/T1w/wsPR05468_BC220963-0011-00001-000176-01.nii,1'
                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/T1w/wsPR05470_AMP_sub07-0002-00001-000176-01.nii,1'
                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/T1w/wsPR05475_BP250490-0011-00001-000176-01.nii,1'
                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/T1w/wsPR05476_AMP_sub08-0002-00001-000176-01.nii,1'
                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/T1w/wsPR05478_MP210591-0011-00001-000176-01.nii,1'
                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/T1w/wsPR05487_TS230991-0002-00001-000176-01.nii,1'
                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/T1w/wsPR05488_JF160665-0011-00001-000176-01.nii,1'
                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/T1w/wsPR05491_BD060172-0002-00001-000176-01.nii,1'
                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/T1w/wsPR05513_RT040889-0011-00001-000176-01.nii,1'
                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/T1w/wsPR05517_DS070360-0002-00001-000176-01.nii,1'
                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/T1w/wsPR05525_NB101091-0011-00001-000176-01.nii,1'
                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/T1w/wsPR05539_WD010441-0011-00001-000176-01.nii,1'
                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/T1w/wsPR05556_TL080781-0002-00001-000176-01.nii,1'
                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/T1w/wsPR05562_ML270349-0011-00001-000176-01.nii,1'
                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/T1w/wsPR05565_AMP_sub18-0002-00001-000176-01.nii,1'
                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/T1w/wsPR05566_TP020596-0011-00001-000176-01.nii,1'
                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/T1w/wsPR05568_YB240158-0011-00001-000176-01.nii,1'
                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/T1w/wsPR05602_DS140990-0011-00001-000176-01.nii,1'
                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/T1w/wsPR05604_CC270493-0011-00001-000176-01.nii,1'
                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/T1w/wsPR05616_VB090787-0011-00001-000176-01.nii,1'
                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/T1w/wsPR05656_DB220996-0011-00001-000176-01.nii,1'
                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/T1w/wsPR05660_LS220198-0002-00001-000176-01.nii,1'
                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/T1w/wsPR05664_PV010890-0011-00001-000176-01.nii,1'
                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/T1w/wsPR05667_AP100458-0011-00001-000176-01.nii,1'
                                               }
                                               }';
matlabbatch{1}.spm.tools.shoot.warp1.templates = {'/Users/Olechka/spm-main/tpm/Template_4.nii'};
%%
%Bringing images to MNI space
matlabbatch{1}.spm.tools.shoot.norm.template = {'/Users/Olechka/spm-main/tpm/Template_4.nii'};

matlabbatch{1}.spm.tools.shoot.norm.data.subjs.deformations = {
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/T1w/y_wsPR05468_BC220963-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/T1w/y_wsPR05470_AMP_sub07-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/T1w/y_wsPR05475_BP250490-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/T1w/y_wsPR05476_AMP_sub08-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/T1w/y_wsPR05478_MP210591-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/T1w/y_wsPR05487_TS230991-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/T1w/y_wsPR05488_JF160665-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/T1w/y_wsPR05491_BD060172-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/T1w/y_wsPR05513_RT040889-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/T1w/y_wsPR05517_DS070360-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/T1w/y_wsPR05525_NB101091-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/T1w/y_wsPR05539_WD010441-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/T1w/y_wsPR05556_TL080781-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/T1w/y_wsPR05562_ML270349-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/T1w/y_wsPR05565_AMP_sub18-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/T1w/y_wsPR05566_TP020596-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/T1w/y_wsPR05568_YB240158-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/T1w/y_wsPR05602_DS140990-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/T1w/y_wsPR05604_CC270493-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/T1w/y_wsPR05616_VB090787-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/T1w/y_wsPR05656_DB220996-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/T1w/y_wsPR05660_LS220198-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/T1w/y_wsPR05664_PV010890-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/T1w/y_wsPR05667_AP100458-0011-00001-000176-01_Template.nii'
                                                               };

matlabbatch{1}.spm.tools.shoot.norm.data.subjs.images = {
                                                         {
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/MajorityVoteFLIRT1mm/wMajorityVote_PR05468_in_T1w_resampled.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/MajorityVoteFLIRT1mm/wMajorityVote_PR05470_in_T1w_resampled.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/MajorityVoteFLIRT1mm/wMajorityVote_PR05475_in_T1w_resampled.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/MajorityVoteFLIRT1mm/wMajorityVote_PR05476_in_T1w_resampled.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/MajorityVoteFLIRT1mm/wMajorityVote_PR05478_in_T1w_resampled.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/MajorityVoteFLIRT1mm/wMajorityVote_PR05487_in_T1w_resampled.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/MajorityVoteFLIRT1mm/wMajorityVote_PR05488_in_T1w_resampled.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/MajorityVoteFLIRT1mm/wMajorityVote_PR05491_in_T1w_resampled.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/MajorityVoteFLIRT1mm/wMajorityVote_PR05513_in_T1w_resampled.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/MajorityVoteFLIRT1mm/wMajorityVote_PR05517_in_T1w_resampled.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/MajorityVoteFLIRT1mm/wMajorityVote_PR05525_in_T1w_resampled.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/MajorityVoteFLIRT1mm/wMajorityVote_PR05539_in_T1w_resampled.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/MajorityVoteFLIRT1mm/wMajorityVote_PR05556_in_T1w_resampled.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/MajorityVoteFLIRT1mm/wMajorityVote_PR05562_in_T1w_resampled.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/MajorityVoteFLIRT1mm/wMajorityVote_PR05565_in_T1w_resampled.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/MajorityVoteFLIRT1mm/wMajorityVote_PR05566_in_T1w_resampled.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/MajorityVoteFLIRT1mm/wMajorityVote_PR05568_in_T1w_resampled.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/MajorityVoteFLIRT1mm/wMajorityVote_PR05602_in_T1w_resampled.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/MajorityVoteFLIRT1mm/wMajorityVote_PR05604_in_T1w_resampled.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/MajorityVoteFLIRT1mm/wMajorityVote_PR05616_in_T1w_resampled.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/MajorityVoteFLIRT1mm/wMajorityVote_PR05656_in_T1w_resampled.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/MajorityVoteFLIRT1mm/wMajorityVote_PR05660_in_T1w_resampled.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/MajorityVoteFLIRT1mm/wMajorityVote_PR05664_in_T1w_resampled.nii'
                                                         '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/MajorityManSeg/MajorityVoteFLIRT1mm/wMajorityVote_PR05667_in_T1w_resampled.nii'
                                                         }
                                                         }';

matlabbatch{1}.spm.tools.shoot.norm.vox = [1 1 1];
matlabbatch{1}.spm.tools.shoot.norm.bb = [NaN NaN NaN
                                          NaN NaN NaN];
matlabbatch{1}.spm.tools.shoot.norm.preserve = 0;
matlabbatch{1}.spm.tools.shoot.norm.fwhm = 0;
%% 
% Bring native outputs to neuromorphometric space
matlabbatch{1}.spm.tools.shoot.norm.template = {'/Volumes/OlgaDrive/PhD/Label/training_data/Template_4.nii'};
matlabbatch{1}.spm.tools.shoot.norm.data.subjs.deformations = {
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05468/y_rc1sPR05468_BC220963-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05470/y_rc1sPR05470_AMP_sub07-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05475/y_rc1sPR05475_BP250490-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05476/y_rc1sPR05476_AMP_sub08-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05478/y_rc1sPR05478_MP210591-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05487/y_rc1sPR05487_TS230991-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05488/y_rc1sPR05488_JF160665-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05491/y_rc1sPR05491_BD060172-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05513/y_rc1sPR05513_RT040889-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05517/y_rc1sPR05517_DS070360-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05525/y_rc1sPR05525_NB101091-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05539/y_rc1sPR05539_WD010441-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05556/y_rc1sPR05556_TL080781-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05562/y_rc1sPR05562_ML270349-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05565/y_rc1sPR05565_AMP_sub18-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05566/y_rc1sPR05566_TP020596-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05568/y_rc1sPR05568_YB240158-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05602/y_rc1sPR05602_DS140990-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05604/y_rc1sPR05604_CC270493-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05616/y_rc1sPR05616_VB090787-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05656/y_rc1sPR05656_DB220996-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05660/y_rc1sPR05660_LS220198-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05664/y_rc1sPR05664_PV010890-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05667/y_rc1sPR05667_AP100458-0011-00001-000176-01_Template.nii'
                                                               };

matlabbatch{1}.spm.tools.shoot.norm.data.subjs.images = {
                                                         {
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Dahl_folder/Data/Dahl_LC_label_sPR05468_BC220963-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Dahl_folder/Data/Dahl_LC_label_sPR05470_AMP_sub07-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Dahl_folder/Data/Dahl_LC_label_sPR05475_BP250490-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Dahl_folder/Data/Dahl_LC_label_sPR05476_AMP_sub08-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Dahl_folder/Data/Dahl_LC_label_sPR05478_MP210591-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Dahl_folder/Data/Dahl_LC_label_sPR05487_TS230991-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Dahl_folder/Data/Dahl_LC_label_sPR05488_JF160665-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Dahl_folder/Data/Dahl_LC_label_sPR05491_BD060172-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Dahl_folder/Data/Dahl_LC_label_sPR05513_RT040889-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Dahl_folder/Data/Dahl_LC_label_sPR05517_DS070360-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Dahl_folder/Data/Dahl_LC_label_sPR05525_NB101091-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Dahl_folder/Data/Dahl_LC_label_sPR05539_WD010441-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Dahl_folder/Data/Dahl_LC_label_sPR05556_TL080781-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Dahl_folder/Data/Dahl_LC_label_sPR05562_ML270349-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Dahl_folder/Data/Dahl_LC_label_sPR05565_AMP_sub18-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Dahl_folder/Data/Dahl_LC_label_sPR05566_TP020596-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Dahl_folder/Data/Dahl_LC_label_sPR05568_YB240158-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Dahl_folder/Data/Dahl_LC_label_sPR05602_DS140990-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Dahl_folder/Data/Dahl_LC_label_sPR05604_CC270493-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Dahl_folder/Data/Dahl_LC_label_sPR05616_VB090787-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Dahl_folder/Data/Dahl_LC_label_sPR05656_DB220996-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Dahl_folder/Data/Dahl_LC_label_sPR05660_LS220198-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Dahl_folder/Data/Dahl_LC_label_sPR05664_PV010890-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Dahl_folder/Data/Dahl_LC_label_sPR05667_AP100458-0011-00001-000176-01.nii'
                                                         }
                                                         {
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Keren_folder/Data/Eckert_LC_label_sPR05468_BC220963-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Keren_folder/Data/Eckert_LC_label_sPR05470_AMP_sub07-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Keren_folder/Data/Eckert_LC_label_sPR05475_BP250490-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Keren_folder/Data/Eckert_LC_label_sPR05476_AMP_sub08-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Keren_folder/Data/Eckert_LC_label_sPR05478_MP210591-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Keren_folder/Data/Eckert_LC_label_sPR05487_TS230991-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Keren_folder/Data/Eckert_LC_label_sPR05488_JF160665-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Keren_folder/Data/Eckert_LC_label_sPR05491_BD060172-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Keren_folder/Data/Eckert_LC_label_sPR05513_RT040889-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Keren_folder/Data/Eckert_LC_label_sPR05517_DS070360-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Keren_folder/Data/Eckert_LC_label_sPR05525_NB101091-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Keren_folder/Data/Eckert_LC_label_sPR05539_WD010441-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Keren_folder/Data/Eckert_LC_label_sPR05556_TL080781-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Keren_folder/Data/Eckert_LC_label_sPR05562_ML270349-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Keren_folder/Data/Eckert_LC_label_sPR05565_AMP_sub18-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Keren_folder/Data/Eckert_LC_label_sPR05566_TP020596-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Keren_folder/Data/Eckert_LC_label_sPR05568_YB240158-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Keren_folder/Data/Eckert_LC_label_sPR05602_DS140990-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Keren_folder/Data/Eckert_LC_label_sPR05604_CC270493-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Keren_folder/Data/Eckert_LC_label_sPR05616_VB090787-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Keren_folder/Data/Eckert_LC_label_sPR05656_DB220996-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Keren_folder/Data/Eckert_LC_label_sPR05660_LS220198-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Keren_folder/Data/Eckert_LC_label_sPR05664_PV010890-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Keren_folder/Data/Eckert_LC_label_sPR05667_AP100458-0011-00001-000176-01.nii'
                                                         }
                                                         {
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Lee_folder/Data/Lee_LC_label_sPR05468_BC220963-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Lee_folder/Data/Lee_LC_label_sPR05470_AMP_sub07-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Lee_folder/Data/Lee_LC_label_sPR05475_BP250490-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Lee_folder/Data/Lee_LC_label_sPR05476_AMP_sub08-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Lee_folder/Data/Lee_LC_label_sPR05478_MP210591-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Lee_folder/Data/Lee_LC_label_sPR05487_TS230991-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Lee_folder/Data/Lee_LC_label_sPR05488_JF160665-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Lee_folder/Data/Lee_LC_label_sPR05491_BD060172-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Lee_folder/Data/Lee_LC_label_sPR05513_RT040889-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Lee_folder/Data/Lee_LC_label_sPR05517_DS070360-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Lee_folder/Data/Lee_LC_label_sPR05525_NB101091-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Lee_folder/Data/Lee_LC_label_sPR05539_WD010441-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Lee_folder/Data/Lee_LC_label_sPR05556_TL080781-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Lee_folder/Data/Lee_LC_label_sPR05562_ML270349-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Lee_folder/Data/Lee_LC_label_sPR05565_AMP_sub18-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Lee_folder/Data/Lee_LC_label_sPR05566_TP020596-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Lee_folder/Data/Lee_LC_label_sPR05568_YB240158-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Lee_folder/Data/Lee_LC_label_sPR05602_DS140990-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Lee_folder/Data/Lee_LC_label_sPR05604_CC270493-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Lee_folder/Data/Lee_LC_label_sPR05616_VB090787-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Lee_folder/Data/Lee_LC_label_sPR05656_DB220996-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Lee_folder/Data/Lee_LC_label_sPR05660_LS220198-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Lee_folder/Data/Lee_LC_label_sPR05664_PV010890-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Lee_folder/Data/Lee_LC_label_sPR05667_AP100458-0011-00001-000176-01.nii'
                                                         }
                                                         {
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Liu_folder/Data/Liu_LC_label_sPR05468_BC220963-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Liu_folder/Data/Liu_LC_label_sPR05470_AMP_sub07-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Liu_folder/Data/Liu_LC_label_sPR05475_BP250490-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Liu_folder/Data/Liu_LC_label_sPR05476_AMP_sub08-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Liu_folder/Data/Liu_LC_label_sPR05478_MP210591-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Liu_folder/Data/Liu_LC_label_sPR05487_TS230991-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Liu_folder/Data/Liu_LC_label_sPR05488_JF160665-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Liu_folder/Data/Liu_LC_label_sPR05491_BD060172-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Liu_folder/Data/Liu_LC_label_sPR05513_RT040889-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Liu_folder/Data/Liu_LC_label_sPR05517_DS070360-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Liu_folder/Data/Liu_LC_label_sPR05525_NB101091-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Liu_folder/Data/Liu_LC_label_sPR05539_WD010441-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Liu_folder/Data/Liu_LC_label_sPR05556_TL080781-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Liu_folder/Data/Liu_LC_label_sPR05562_ML270349-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Liu_folder/Data/Liu_LC_label_sPR05565_AMP_sub18-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Liu_folder/Data/Liu_LC_label_sPR05566_TP020596-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Liu_folder/Data/Liu_LC_label_sPR05568_YB240158-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Liu_folder/Data/Liu_LC_label_sPR05602_DS140990-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Liu_folder/Data/Liu_LC_label_sPR05604_CC270493-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Liu_folder/Data/Liu_LC_label_sPR05616_VB090787-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Liu_folder/Data/Liu_LC_label_sPR05656_DB220996-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Liu_folder/Data/Liu_LC_label_sPR05660_LS220198-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Liu_folder/Data/Liu_LC_label_sPR05664_PV010890-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Liu_folder/Data/Liu_LC_label_sPR05667_AP100458-0011-00001-000176-01.nii'
                                                         }
                                                         {
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Tona_folder/Data/Tona_LC_label_left_sPR05468_BC220963-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Tona_folder/Data/Tona_LC_label_left_sPR05470_AMP_sub07-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Tona_folder/Data/Tona_LC_label_left_sPR05475_BP250490-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Tona_folder/Data/Tona_LC_label_left_sPR05476_AMP_sub08-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Tona_folder/Data/Tona_LC_label_left_sPR05478_MP210591-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Tona_folder/Data/Tona_LC_label_left_sPR05487_TS230991-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Tona_folder/Data/Tona_LC_label_left_sPR05488_JF160665-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Tona_folder/Data/Tona_LC_label_left_sPR05491_BD060172-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Tona_folder/Data/Tona_LC_label_left_sPR05513_RT040889-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Tona_folder/Data/Tona_LC_label_left_sPR05517_DS070360-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Tona_folder/Data/Tona_LC_label_left_sPR05525_NB101091-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Tona_folder/Data/Tona_LC_label_left_sPR05539_WD010441-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Tona_folder/Data/Tona_LC_label_left_sPR05556_TL080781-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Tona_folder/Data/Tona_LC_label_left_sPR05562_ML270349-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Tona_folder/Data/Tona_LC_label_left_sPR05565_AMP_sub18-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Tona_folder/Data/Tona_LC_label_left_sPR05566_TP020596-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Tona_folder/Data/Tona_LC_label_left_sPR05568_YB240158-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Tona_folder/Data/Tona_LC_label_left_sPR05602_DS140990-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Tona_folder/Data/Tona_LC_label_left_sPR05604_CC270493-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Tona_folder/Data/Tona_LC_label_left_sPR05616_VB090787-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Tona_folder/Data/Tona_LC_label_left_sPR05656_DB220996-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Tona_folder/Data/Tona_LC_label_left_sPR05660_LS220198-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Tona_folder/Data/Tona_LC_label_left_sPR05664_PV010890-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Tona_folder/Data/Tona_LC_label_left_sPR05667_AP100458-0011-00001-000176-01.nii'
                                                         }
                                                         {
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Tona_folder/Data/Tona_LC_label_right_sPR05468_BC220963-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Tona_folder/Data/Tona_LC_label_right_sPR05470_AMP_sub07-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Tona_folder/Data/Tona_LC_label_right_sPR05475_BP250490-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Tona_folder/Data/Tona_LC_label_right_sPR05476_AMP_sub08-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Tona_folder/Data/Tona_LC_label_right_sPR05478_MP210591-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Tona_folder/Data/Tona_LC_label_right_sPR05487_TS230991-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Tona_folder/Data/Tona_LC_label_right_sPR05488_JF160665-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Tona_folder/Data/Tona_LC_label_right_sPR05491_BD060172-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Tona_folder/Data/Tona_LC_label_right_sPR05513_RT040889-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Tona_folder/Data/Tona_LC_label_right_sPR05517_DS070360-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Tona_folder/Data/Tona_LC_label_right_sPR05525_NB101091-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Tona_folder/Data/Tona_LC_label_right_sPR05539_WD010441-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Tona_folder/Data/Tona_LC_label_right_sPR05556_TL080781-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Tona_folder/Data/Tona_LC_label_right_sPR05562_ML270349-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Tona_folder/Data/Tona_LC_label_right_sPR05565_AMP_sub18-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Tona_folder/Data/Tona_LC_label_right_sPR05566_TP020596-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Tona_folder/Data/Tona_LC_label_right_sPR05568_YB240158-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Tona_folder/Data/Tona_LC_label_right_sPR05602_DS140990-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Tona_folder/Data/Tona_LC_label_right_sPR05604_CC270493-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Tona_folder/Data/Tona_LC_label_right_sPR05616_VB090787-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Tona_folder/Data/Tona_LC_label_right_sPR05656_DB220996-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Tona_folder/Data/Tona_LC_label_right_sPR05660_LS220198-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Tona_folder/Data/Tona_LC_label_right_sPR05664_PV010890-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Tona_folder/Data/Tona_LC_label_right_sPR05667_AP100458-0011-00001-000176-01.nii'
                                                         }
                                                         {
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Ye_folder/Data/Ye_LC_label_sPR05468_BC220963-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Ye_folder/Data/Ye_LC_label_sPR05470_AMP_sub07-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Ye_folder/Data/Ye_LC_label_sPR05475_BP250490-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Ye_folder/Data/Ye_LC_label_sPR05476_AMP_sub08-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Ye_folder/Data/Ye_LC_label_sPR05478_MP210591-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Ye_folder/Data/Ye_LC_label_sPR05487_TS230991-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Ye_folder/Data/Ye_LC_label_sPR05488_JF160665-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Ye_folder/Data/Ye_LC_label_sPR05491_BD060172-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Ye_folder/Data/Ye_LC_label_sPR05513_RT040889-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Ye_folder/Data/Ye_LC_label_sPR05517_DS070360-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Ye_folder/Data/Ye_LC_label_sPR05525_NB101091-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Ye_folder/Data/Ye_LC_label_sPR05539_WD010441-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Ye_folder/Data/Ye_LC_label_sPR05556_TL080781-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Ye_folder/Data/Ye_LC_label_sPR05562_ML270349-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Ye_folder/Data/Ye_LC_label_sPR05565_AMP_sub18-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Ye_folder/Data/Ye_LC_label_sPR05566_TP020596-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Ye_folder/Data/Ye_LC_label_sPR05568_YB240158-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Ye_folder/Data/Ye_LC_label_sPR05602_DS140990-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Ye_folder/Data/Ye_LC_label_sPR05604_CC270493-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Ye_folder/Data/Ye_LC_label_sPR05616_VB090787-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Ye_folder/Data/Ye_LC_label_sPR05656_DB220996-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Ye_folder/Data/Ye_LC_label_sPR05660_LS220198-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Ye_folder/Data/Ye_LC_label_sPR05664_PV010890-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Ye_folder/Data/Ye_LC_label_sPR05667_AP100458-0011-00001-000176-01.nii'
                                                         }
                                                         {
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/LCnorm_folder/Data/Olga_LC_label_sPR05468_BC220963-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/LCnorm_folder/Data/Olga_LC_label_sPR05470_AMP_sub07-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/LCnorm_folder/Data/Olga_LC_label_sPR05475_BP250490-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/LCnorm_folder/Data/Olga_LC_label_sPR05476_AMP_sub08-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/LCnorm_folder/Data/Olga_LC_label_sPR05478_MP210591-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/LCnorm_folder/Data/Olga_LC_label_sPR05487_TS230991-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/LCnorm_folder/Data/Olga_LC_label_sPR05488_JF160665-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/LCnorm_folder/Data/Olga_LC_label_sPR05491_BD060172-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/LCnorm_folder/Data/Olga_LC_label_sPR05513_RT040889-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/LCnorm_folder/Data/Olga_LC_label_sPR05517_DS070360-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/LCnorm_folder/Data/Olga_LC_label_sPR05525_NB101091-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/LCnorm_folder/Data/Olga_LC_label_sPR05539_WD010441-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/LCnorm_folder/Data/Olga_LC_label_sPR05556_TL080781-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/LCnorm_folder/Data/Olga_LC_label_sPR05562_ML270349-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/LCnorm_folder/Data/Olga_LC_label_sPR05565_AMP_sub18-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/LCnorm_folder/Data/Olga_LC_label_sPR05566_TP020596-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/LCnorm_folder/Data/Olga_LC_label_sPR05568_YB240158-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/LCnorm_folder/Data/Olga_LC_label_sPR05602_DS140990-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/LCnorm_folder/Data/Olga_LC_label_sPR05604_CC270493-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/LCnorm_folder/Data/Olga_LC_label_sPR05616_VB090787-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/LCnorm_folder/Data/Olga_LC_label_sPR05656_DB220996-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/LCnorm_folder/Data/Olga_LC_label_sPR05660_LS220198-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/LCnorm_folder/Data/Olga_LC_label_sPR05664_PV010890-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/LCnorm_folder/Data/Olga_LC_label_sPR05667_AP100458-0011-00001-000176-01.nii'
                                                         }
                                                         {
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05468/AVEraged_LC_label_sPR05468_BC220963-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05470/AVEraged_LC_label_sPR05470_AMP_sub07-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05475/AVEraged_LC_label_sPR05475_BP250490-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05476/AVEraged_LC_label_sPR05476_AMP_sub08-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05478/AVEraged_LC_label_sPR05478_MP210591-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05487/AVEraged_LC_label_sPR05487_TS230991-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05488/AVEraged_LC_label_sPR05488_JF160665-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05491/AVEraged_LC_label_sPR05491_BD060172-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05513/AVEraged_LC_label_sPR05513_RT040889-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05517/AVEraged_LC_label_sPR05517_DS070360-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05525/AVEraged_LC_label_sPR05525_NB101091-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05539/AVEraged_LC_label_sPR05539_WD010441-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05556/AVEraged_LC_label_sPR05556_TL080781-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05562/AVEraged_LC_label_sPR05562_ML270349-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05565/AVEraged_LC_label_sPR05565_AMP_sub18-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05566/AVEraged_LC_label_sPR05566_TP020596-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05568/AVEraged_LC_label_sPR05568_YB240158-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05602/AVEraged_LC_label_sPR05602_DS140990-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05604/AVEraged_LC_label_sPR05604_CC270493-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05616/AVEraged_LC_label_sPR05616_VB090787-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05656/AVEraged_LC_label_sPR05656_DB220996-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05660/AVEraged_LC_label_sPR05660_LS220198-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05664/AVEraged_LC_label_sPR05664_PV010890-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Results/LC_label_comparison/sPR05667/AVEraged_LC_label_sPR05667_AP100458-0011-00001-000176-01.nii'
                                                         }
                                                         {
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Betts_folder/Data/Betts_LC_label_sPR05468_BC220963-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Betts_folder/Data/Betts_LC_label_sPR05470_AMP_sub07-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Betts_folder/Data/Betts_LC_label_sPR05475_BP250490-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Betts_folder/Data/Betts_LC_label_sPR05476_AMP_sub08-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Betts_folder/Data/Betts_LC_label_sPR05478_MP210591-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Betts_folder/Data/Betts_LC_label_sPR05487_TS230991-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Betts_folder/Data/Betts_LC_label_sPR05488_JF160665-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Betts_folder/Data/Betts_LC_label_sPR05491_BD060172-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Betts_folder/Data/Betts_LC_label_sPR05513_RT040889-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Betts_folder/Data/Betts_LC_label_sPR05517_DS070360-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Betts_folder/Data/Betts_LC_label_sPR05525_NB101091-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Betts_folder/Data/Betts_LC_label_sPR05539_WD010441-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Betts_folder/Data/Betts_LC_label_sPR05556_TL080781-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Betts_folder/Data/Betts_LC_label_sPR05562_ML270349-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Betts_folder/Data/Betts_LC_label_sPR05565_AMP_sub18-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Betts_folder/Data/Betts_LC_label_sPR05566_TP020596-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Betts_folder/Data/Betts_LC_label_sPR05568_YB240158-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Betts_folder/Data/Betts_LC_label_sPR05602_DS140990-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Betts_folder/Data/Betts_LC_label_sPR05604_CC270493-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Betts_folder/Data/Betts_LC_label_sPR05616_VB090787-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Betts_folder/Data/Betts_LC_label_sPR05656_DB220996-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Betts_folder/Data/Betts_LC_label_sPR05660_LS220198-0002-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Betts_folder/Data/Betts_LC_label_sPR05664_PV010890-0011-00001-000176-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_Labels/Betts_folder/Data/Betts_LC_label_sPR05667_AP100458-0011-00001-000176-01.nii'
                                                         }
                                                         }';
matlabbatch{1}.spm.tools.shoot.norm.vox = [1 1 1];
matlabbatch{1}.spm.tools.shoot.norm.bb = [NaN NaN NaN
                                          NaN NaN NaN];
matlabbatch{1}.spm.tools.shoot.norm.preserve = 0;
matlabbatch{1}.spm.tools.shoot.norm.fwhm = 0;
%%
%Do with TPMs 
matlabbatch{1}.spm.tools.shoot.norm.template = {'/Volumes/OlgaDrive/PhD/Label/training_data/Template_4.nii'};
matlabbatch{1}.spm.tools.shoot.norm.data.subjs.deformations = {
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05468/y_rc1sPR05468_BC220963-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05470/y_rc1sPR05470_AMP_sub07-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05475/y_rc1sPR05475_BP250490-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05476/y_rc1sPR05476_AMP_sub08-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05478/y_rc1sPR05478_MP210591-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05487/y_rc1sPR05487_TS230991-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05488/y_rc1sPR05488_JF160665-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05491/y_rc1sPR05491_BD060172-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05513/y_rc1sPR05513_RT040889-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05517/y_rc1sPR05517_DS070360-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05525/y_rc1sPR05525_NB101091-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05539/y_rc1sPR05539_WD010441-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05556/y_rc1sPR05556_TL080781-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05562/y_rc1sPR05562_ML270349-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05565/y_rc1sPR05565_AMP_sub18-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05566/y_rc1sPR05566_TP020596-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05568/y_rc1sPR05568_YB240158-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05602/y_rc1sPR05602_DS140990-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05604/y_rc1sPR05604_CC270493-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05616/y_rc1sPR05616_VB090787-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05656/y_rc1sPR05656_DB220996-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05660/y_rc1sPR05660_LS220198-0002-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05664/y_rc1sPR05664_PV010890-0011-00001-000176-01_Template.nii'
                                                               '/Volumes/OlgaDrive/PhD/NEW_PIPELINE/T1w_processing/PR05667/y_rc1sPR05667_AP100458-0011-00001-000176-01_Template.nii'
                                                               };
matlabbatch{1}.spm.tools.shoot.norm.data.subjs.images = {
                                                         {
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Betts_Seg/Betts_c7coreg_sPR05468_BC220963-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Betts_Seg/Betts_c7coreg_sPR05470_AMP_sub07-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Betts_Seg/Betts_c7coreg_sPR05475_BP250490-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Betts_Seg/Betts_c7coreg_sPR05476_AMP_sub08-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Betts_Seg/Betts_c7coreg_sPR05478_MP210591-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Betts_Seg/Betts_c7coreg_sPR05487_TS230991-0006-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Betts_Seg/Betts_c7coreg_sPR05488_JF160665-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Betts_Seg/Betts_c7coreg_sPR05491_BD060172-0003-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Betts_Seg/Betts_c7coreg_sPR05513_RT040889-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Betts_Seg/Betts_c7coreg_sPR05517_DS070360-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Betts_Seg/Betts_c7coreg_sPR05525_NB101091-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Betts_Seg/Betts_c7coreg_sPR05539_WD010441-0012-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Betts_Seg/Betts_c7coreg_sPR05556_TL080781-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Betts_Seg/Betts_c7coreg_sPR05562_ML270349-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Betts_Seg/Betts_c7coreg_sPR05565_AMP_sub18-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Betts_Seg/Betts_c7coreg_sPR05566_TP020596-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Betts_Seg/Betts_c7coreg_sPR05568_YB240158-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Betts_Seg/Betts_c7coreg_sPR05602_DS140990-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Betts_Seg/Betts_c7coreg_sPR05604_CC270493-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Betts_Seg/Betts_c7coreg_sPR05616_VB090787-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Betts_Seg/Betts_c7coreg_sPR05656_DB220996-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Betts_Seg/Betts_c7coreg_sPR05660_LS220198-0003-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Betts_Seg/Betts_c7coreg_sPR05664_PV010890-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Betts_Seg/Betts_c7coreg_sPR05667_AP100458-0013-00001-000001-01.nii'
                                                         }
                                                         {
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Dahl_Seg/Dahl_c7coreg_sPR05468_BC220963-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Dahl_Seg/Dahl_c7coreg_sPR05470_AMP_sub07-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Dahl_Seg/Dahl_c7coreg_sPR05475_BP250490-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Dahl_Seg/Dahl_c7coreg_sPR05476_AMP_sub08-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Dahl_Seg/Dahl_c7coreg_sPR05478_MP210591-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Dahl_Seg/Dahl_c7coreg_sPR05487_TS230991-0006-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Dahl_Seg/Dahl_c7coreg_sPR05488_JF160665-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Dahl_Seg/Dahl_c7coreg_sPR05491_BD060172-0003-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Dahl_Seg/Dahl_c7coreg_sPR05513_RT040889-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Dahl_Seg/Dahl_c7coreg_sPR05517_DS070360-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Dahl_Seg/Dahl_c7coreg_sPR05525_NB101091-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Dahl_Seg/Dahl_c7coreg_sPR05539_WD010441-0012-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Dahl_Seg/Dahl_c7coreg_sPR05556_TL080781-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Dahl_Seg/Dahl_c7coreg_sPR05562_ML270349-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Dahl_Seg/Dahl_c7coreg_sPR05565_AMP_sub18-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Dahl_Seg/Dahl_c7coreg_sPR05566_TP020596-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Dahl_Seg/Dahl_c7coreg_sPR05568_YB240158-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Dahl_Seg/Dahl_c7coreg_sPR05602_DS140990-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Dahl_Seg/Dahl_c7coreg_sPR05604_CC270493-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Dahl_Seg/Dahl_c7coreg_sPR05616_VB090787-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Dahl_Seg/Dahl_c7coreg_sPR05656_DB220996-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Dahl_Seg/Dahl_c7coreg_sPR05660_LS220198-0003-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Dahl_Seg/Dahl_c7coreg_sPR05664_PV010890-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Dahl_Seg/Dahl_c7coreg_sPR05667_AP100458-0013-00001-000001-01.nii'
                                                         }
                                                         {
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Eckert_Seg/Keren_c7coreg_sPR05468_BC220963-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Eckert_Seg/Keren_c7coreg_sPR05470_AMP_sub07-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Eckert_Seg/Keren_c7coreg_sPR05475_BP250490-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Eckert_Seg/Keren_c7coreg_sPR05476_AMP_sub08-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Eckert_Seg/Keren_c7coreg_sPR05478_MP210591-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Eckert_Seg/Keren_c7coreg_sPR05487_TS230991-0006-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Eckert_Seg/Keren_c7coreg_sPR05488_JF160665-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Eckert_Seg/Keren_c7coreg_sPR05491_BD060172-0003-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Eckert_Seg/Keren_c7coreg_sPR05513_RT040889-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Eckert_Seg/Keren_c7coreg_sPR05517_DS070360-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Eckert_Seg/Keren_c7coreg_sPR05525_NB101091-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Eckert_Seg/Keren_c7coreg_sPR05539_WD010441-0012-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Eckert_Seg/Keren_c7coreg_sPR05556_TL080781-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Eckert_Seg/Keren_c7coreg_sPR05562_ML270349-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Eckert_Seg/Keren_c7coreg_sPR05565_AMP_sub18-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Eckert_Seg/Keren_c7coreg_sPR05566_TP020596-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Eckert_Seg/Keren_c7coreg_sPR05568_YB240158-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Eckert_Seg/Keren_c7coreg_sPR05602_DS140990-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Eckert_Seg/Keren_c7coreg_sPR05604_CC270493-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Eckert_Seg/Keren_c7coreg_sPR05616_VB090787-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Eckert_Seg/Keren_c7coreg_sPR05656_DB220996-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Eckert_Seg/Keren_c7coreg_sPR05660_LS220198-0003-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Eckert_Seg/Keren_c7coreg_sPR05664_PV010890-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Eckert_Seg/Keren_c7coreg_sPR05667_AP100458-0013-00001-000001-01.nii'
                                                         }
                                                         {
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Lee_Seg/Lee_c7coreg_sPR05468_BC220963-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Lee_Seg/Lee_c7coreg_sPR05470_AMP_sub07-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Lee_Seg/Lee_c7coreg_sPR05475_BP250490-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Lee_Seg/Lee_c7coreg_sPR05476_AMP_sub08-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Lee_Seg/Lee_c7coreg_sPR05478_MP210591-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Lee_Seg/Lee_c7coreg_sPR05487_TS230991-0006-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Lee_Seg/Lee_c7coreg_sPR05488_JF160665-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Lee_Seg/Lee_c7coreg_sPR05491_BD060172-0003-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Lee_Seg/Lee_c7coreg_sPR05513_RT040889-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Lee_Seg/Lee_c7coreg_sPR05517_DS070360-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Lee_Seg/Lee_c7coreg_sPR05525_NB101091-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Lee_Seg/Lee_c7coreg_sPR05539_WD010441-0012-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Lee_Seg/Lee_c7coreg_sPR05556_TL080781-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Lee_Seg/Lee_c7coreg_sPR05562_ML270349-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Lee_Seg/Lee_c7coreg_sPR05565_AMP_sub18-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Lee_Seg/Lee_c7coreg_sPR05566_TP020596-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Lee_Seg/Lee_c7coreg_sPR05568_YB240158-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Lee_Seg/Lee_c7coreg_sPR05602_DS140990-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Lee_Seg/Lee_c7coreg_sPR05604_CC270493-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Lee_Seg/Lee_c7coreg_sPR05616_VB090787-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Lee_Seg/Lee_c7coreg_sPR05656_DB220996-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Lee_Seg/Lee_c7coreg_sPR05660_LS220198-0003-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Lee_Seg/Lee_c7coreg_sPR05664_PV010890-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Lee_Seg/Lee_c7coreg_sPR05667_AP100458-0013-00001-000001-01.nii'
                                                         }
                                                         {
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Liu_Seg/Liu_c7coreg_sPR05468_BC220963-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Liu_Seg/Liu_c7coreg_sPR05470_AMP_sub07-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Liu_Seg/Liu_c7coreg_sPR05475_BP250490-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Liu_Seg/Liu_c7coreg_sPR05476_AMP_sub08-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Liu_Seg/Liu_c7coreg_sPR05478_MP210591-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Liu_Seg/Liu_c7coreg_sPR05487_TS230991-0006-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Liu_Seg/Liu_c7coreg_sPR05488_JF160665-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Liu_Seg/Liu_c7coreg_sPR05491_BD060172-0003-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Liu_Seg/Liu_c7coreg_sPR05513_RT040889-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Liu_Seg/Liu_c7coreg_sPR05517_DS070360-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Liu_Seg/Liu_c7coreg_sPR05525_NB101091-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Liu_Seg/Liu_c7coreg_sPR05539_WD010441-0012-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Liu_Seg/Liu_c7coreg_sPR05556_TL080781-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Liu_Seg/Liu_c7coreg_sPR05562_ML270349-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Liu_Seg/Liu_c7coreg_sPR05565_AMP_sub18-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Liu_Seg/Liu_c7coreg_sPR05566_TP020596-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Liu_Seg/Liu_c7coreg_sPR05568_YB240158-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Liu_Seg/Liu_c7coreg_sPR05602_DS140990-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Liu_Seg/Liu_c7coreg_sPR05604_CC270493-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Liu_Seg/Liu_c7coreg_sPR05616_VB090787-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Liu_Seg/Liu_c7coreg_sPR05656_DB220996-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Liu_Seg/Liu_c7coreg_sPR05660_LS220198-0003-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Liu_Seg/Liu_c7coreg_sPR05664_PV010890-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Liu_Seg/Liu_c7coreg_sPR05667_AP100458-0013-00001-000001-01.nii'
                                                         }
                                                         {
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Tona_Seg/Tona_c7coreg_sPR05468_BC220963-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Tona_Seg/Tona_c7coreg_sPR05470_AMP_sub07-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Tona_Seg/Tona_c7coreg_sPR05475_BP250490-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Tona_Seg/Tona_c7coreg_sPR05476_AMP_sub08-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Tona_Seg/Tona_c7coreg_sPR05478_MP210591-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Tona_Seg/Tona_c7coreg_sPR05487_TS230991-0006-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Tona_Seg/Tona_c7coreg_sPR05488_JF160665-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Tona_Seg/Tona_c7coreg_sPR05491_BD060172-0003-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Tona_Seg/Tona_c7coreg_sPR05513_RT040889-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Tona_Seg/Tona_c7coreg_sPR05517_DS070360-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Tona_Seg/Tona_c7coreg_sPR05525_NB101091-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Tona_Seg/Tona_c7coreg_sPR05539_WD010441-0012-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Tona_Seg/Tona_c7coreg_sPR05556_TL080781-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Tona_Seg/Tona_c7coreg_sPR05562_ML270349-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Tona_Seg/Tona_c7coreg_sPR05565_AMP_sub18-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Tona_Seg/Tona_c7coreg_sPR05566_TP020596-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Tona_Seg/Tona_c7coreg_sPR05568_YB240158-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Tona_Seg/Tona_c7coreg_sPR05602_DS140990-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Tona_Seg/Tona_c7coreg_sPR05604_CC270493-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Tona_Seg/Tona_c7coreg_sPR05616_VB090787-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Tona_Seg/Tona_c7coreg_sPR05656_DB220996-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Tona_Seg/Tona_c7coreg_sPR05660_LS220198-0003-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Tona_Seg/Tona_c7coreg_sPR05664_PV010890-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Tona_Seg/Tona_c7coreg_sPR05667_AP100458-0013-00001-000001-01.nii'
                                                         }
                                                         {
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Ye_Seg/Ye_c7coreg_sPR05468_BC220963-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Ye_Seg/Ye_c7coreg_sPR05470_AMP_sub07-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Ye_Seg/Ye_c7coreg_sPR05475_BP250490-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Ye_Seg/Ye_c7coreg_sPR05476_AMP_sub08-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Ye_Seg/Ye_c7coreg_sPR05478_MP210591-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Ye_Seg/Ye_c7coreg_sPR05487_TS230991-0006-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Ye_Seg/Ye_c7coreg_sPR05488_JF160665-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Ye_Seg/Ye_c7coreg_sPR05491_BD060172-0003-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Ye_Seg/Ye_c7coreg_sPR05513_RT040889-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Ye_Seg/Ye_c7coreg_sPR05517_DS070360-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Ye_Seg/Ye_c7coreg_sPR05525_NB101091-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Ye_Seg/Ye_c7coreg_sPR05539_WD010441-0012-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Ye_Seg/Ye_c7coreg_sPR05556_TL080781-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Ye_Seg/Ye_c7coreg_sPR05562_ML270349-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Ye_Seg/Ye_c7coreg_sPR05565_AMP_sub18-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Ye_Seg/Ye_c7coreg_sPR05566_TP020596-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Ye_Seg/Ye_c7coreg_sPR05568_YB240158-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Ye_Seg/Ye_c7coreg_sPR05602_DS140990-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Ye_Seg/Ye_c7coreg_sPR05604_CC270493-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Ye_Seg/Ye_c7coreg_sPR05616_VB090787-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Ye_Seg/Ye_c7coreg_sPR05656_DB220996-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Ye_Seg/Ye_c7coreg_sPR05660_LS220198-0003-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Ye_Seg/Ye_c7coreg_sPR05664_PV010890-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Ye_Seg/Ye_c7coreg_sPR05667_AP100458-0013-00001-000001-01.nii'
                                                         }
                                                         {
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Olga_Seg/Olga_c7coreg_sPR05468_BC220963-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Olga_Seg/Olga_c7coreg_sPR05470_AMP_sub07-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Olga_Seg/Olga_c7coreg_sPR05475_BP250490-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Olga_Seg/Olga_c7coreg_sPR05476_AMP_sub08-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Olga_Seg/Olga_c7coreg_sPR05478_MP210591-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Olga_Seg/Olga_c7coreg_sPR05487_TS230991-0006-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Olga_Seg/Olga_c7coreg_sPR05488_JF160665-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Olga_Seg/Olga_c7coreg_sPR05491_BD060172-0003-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Olga_Seg/Olga_c7coreg_sPR05513_RT040889-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Olga_Seg/Olga_c7coreg_sPR05517_DS070360-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Olga_Seg/Olga_c7coreg_sPR05525_NB101091-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Olga_Seg/Olga_c7coreg_sPR05539_WD010441-0012-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Olga_Seg/Olga_c7coreg_sPR05556_TL080781-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Olga_Seg/Olga_c7coreg_sPR05562_ML270349-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Olga_Seg/Olga_c7coreg_sPR05565_AMP_sub18-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Olga_Seg/Olga_c7coreg_sPR05566_TP020596-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Olga_Seg/Olga_c7coreg_sPR05568_YB240158-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Olga_Seg/Olga_c7coreg_sPR05602_DS140990-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Olga_Seg/Olga_c7coreg_sPR05604_CC270493-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Olga_Seg/Olga_c7coreg_sPR05616_VB090787-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Olga_Seg/Olga_c7coreg_sPR05656_DB220996-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Olga_Seg/Olga_c7coreg_sPR05660_LS220198-0003-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Olga_Seg/Olga_c7coreg_sPR05664_PV010890-0013-00001-000001-01.nii'
                                                         '/Volumes/OlgaDrive/PhD/Olga_Backup/Feb_UniSeg/Olga_Seg/Olga_c7coreg_sPR05667_AP100458-0013-00001-000001-01.nii'
                                                         }
                                                         }';
matlabbatch{1}.spm.tools.shoot.norm.vox = [1 1 1];
matlabbatch{1}.spm.tools.shoot.norm.bb = [NaN NaN NaN
                                          NaN NaN NaN];
matlabbatch{1}.spm.tools.shoot.norm.preserve = 0;
matlabbatch{1}.spm.tools.shoot.norm.fwhm = 0;
