% spm12w r6225
% Parameters file for 1st level glm analysis and 2nd level rfx analysis
% Last updated: October, 2016
% =======1=========2=========3=========4=========5=========6=========7=========8
%
% Tutorial note: 
% The purpose of this file is to give you an exmaple of how to run a simple
% GLM and how to specify the various types of contrasts for a simple study.
%
% Three ways to run this file: 
% 1> spm12w    #Use the gui and select "Estimate GLM"
% 2> spm12w_glm_compute('sid','s01','glm_file','glm_tutorial.m')
% 3> spm12w('stage','glm', 'sids','s01','para_file','glm_tutorial.m')

% User name
glm.username = 'ddw';

% GLM input/output directory
glm.prep_name = 'epi_norm';
glm.glm_name = 'glm_tutorial_para';

% GLM onsets directory name
glm.ons_dir  = 'tutorial';

% GLM Conditions (cell arrays seperated by commas)
glm.events     = {'human','animal','vegetable','mineral'};
glm.blocks     = {};
glm.regressors = {};

% GLM Parametric modualtors - Special keyword: 'allthethings'
glm.parametrics = {'humanxattract','humanxlike'}; 

% GLM Contrasts - Numeric contrasts should sum to zero unless vs. baseline
%               - String contrasts must match Condition names.
%               - String contrast direction determine by the placement of 'vs.'
%               - Special keywords: 'housewine' | 'fir_bins' | 'fir_hrf'
% Note that the housewine's allVSbaseline will skip pmods but is not savy
% to complex designs (i.e., where you want all conditions VS baseline but
% not your user supplied regressors under glm.regressors, so in those cases
% you should create your own allVSbaseline and refuse the housewine). 
glm.con.housewine = 'housewine';

% note that you get pmod contrasts for free with the housewine, but for the
% sake of example here are two ways to generate pmod contrasts
glm.con.humattrct = 'humanxattract'; 
glm.con.humlike   = [0 0 1];

% RFX Specification
glm.rfx_name = 'rfx_tutorial_para';
glm.rfx_conds = {'allVSbaseline','humattrct'};