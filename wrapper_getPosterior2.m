%addpath /shared/persisted/nsltools
%load('/shared/persisted/gab4Run');
%load('/shared/persisted/folder1BabbleGab.mat');

%load('/shared/persisted/babteModelsAdapt.mat');
%outFile = '/shared/persisted/out2.mat';
outFile1 = 'out6.mat';
outFile2 = 'out7.mat';






for j = 4; for k = 1 : 6; [postAll_bab_al_0_rho_005_allDim_majRulGablowrate_vn_vn(j,k,:) ads] = getPost_crossvalid_maj_fast(folder1BabbleGab(k).name, '*_1.gabmatlowrate*al_0' , '_1.gabmatlowrate_' , ['*gabmatlowrate*al_0'], modelsAll_bab_al_0_rho_005_vnoise_vnoiseGablowrate(k,:), indAll_whi_al_0_vnoise_vclean, 105) ; save(outFile1, 'postAll_bab_al_0_rho_005_allDim_majRulGablowrate_vn_vn');end;end

