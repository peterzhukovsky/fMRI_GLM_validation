# fMRI_GLM_validation
Using BOLD activity from preprocessed ROI timeseries to predict trial type: a validation of the standard mass univariate fMRI GLM.

  # batch_denoising_ts_job.m 
Using the rsHRF toolbox to preprocess and deconvolve the extracted timeseries. rsHRF toolbox downloaded from https://github.com/compneuro-da/rsHRF

  # activation_logit_SDI.m / activation_logit_reg.m / activation_logit_reg_SIBs.m
These scripts (one for each group -  SDI or stimulant dependent individuals, SIB or siblings and Healthy Controls) fulfils several functions: 
1) extracting activations corresponding to premature and correct trials. 
2) Running a logistic regression for each subject to predict trial type based on the activation; comparing average activations for premature vs correct responses using t-tests
3) Plotting average BOLD activation timecourses (with 95% CI) for several ROIs that were significantly active in the mass univariate GLM.

  # R_code_logit.R
multilevel logistic regression using R (glmer) with participant-level random effects. Predicting trial type (premature vs correct) using 
