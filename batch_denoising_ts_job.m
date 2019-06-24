%-----------------------------------------------------------------------
% Job saved on 18-Oct-2018 22:33:33 by cfg_util (rev $Rev: 6460 $)
% spm SPM - SPM12 (6906)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------
%36-76 SDIs
%1-35 HCs
for i=84:126%36:76%1:35%:length(files);
clear matlabbatch;
    IFGts_name=cellstr(strcat('G:\Impulsivity_project\DCM\MID\', files(i),'\rIFG_ts.txt'));
    outdir_name=cellstr(strcat('G:\Impulsivity_project\DCM\MID\', files(i)));
    motion_name=cellstr(strcat('G:\Impulsivity_project\DCM\MID\', files(i),'\prefiltered_func_data_mcf.par.txt'));
matlabbatch{1}.spm.tools.HRF.sig_rsHRF.Datasig{1}.sigdata = IFGts_name;
matlabbatch{1}.spm.tools.HRF.sig_rsHRF.HRFE.hrfm = 1;
matlabbatch{1}.spm.tools.HRF.sig_rsHRF.HRFE.TR = 2;
matlabbatch{1}.spm.tools.HRF.sig_rsHRF.HRFE.hrflen = 32;
matlabbatch{1}.spm.tools.HRF.sig_rsHRF.HRFE.thr = 1;
matlabbatch{1}.spm.tools.HRF.sig_rsHRF.HRFE.mdelay = [4 8];
matlabbatch{1}.spm.tools.HRF.sig_rsHRF.HRFE.cvi = 0;
matlabbatch{1}.spm.tools.HRF.sig_rsHRF.HRFE.fmri_t = 1;
matlabbatch{1}.spm.tools.HRF.sig_rsHRF.HRFE.fmri_t0 = 1;
matlabbatch{1}.spm.tools.HRF.sig_rsHRF.Denoising.generic{1}.multi_reg = cell([0, 1]); % = motion_name; % 
matlabbatch{1}.spm.tools.HRF.sig_rsHRF.Denoising.bands = {[0.0001 0.3]};
matlabbatch{1}.spm.tools.HRF.sig_rsHRF.Denoising.Detrend = 0;
matlabbatch{1}.spm.tools.HRF.sig_rsHRF.Denoising.Despiking = 1;
matlabbatch{1}.spm.tools.HRF.sig_rsHRF.outdir = outdir_name;
matlabbatch{1}.spm.tools.HRF.sig_rsHRF.prefix = 'Deconv_';
spm_jobman('run', matlabbatch);

end