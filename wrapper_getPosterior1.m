%addpath /shared/persisted/nsltools
%load('/shared/persisted/gab4Run');
%load('/shared/persisted/folder1BabbleGab.mat');

%load('/shared/persisted/babteModelsAdapt.mat');
%outFile = '/shared/persisted/out2.mat';
outFile1 = 'out6.mat';
outFile2 = 'out7.mat';



for j = 4; for k = 1 : 6; [postAll_bab_al_0_2_rho_02_allDim_majRulGablowrate_vn_vn(j,k,:) ads] = getPost_crossvalid_maj_fast(folder1BabbleGab(k).name, [ '*_1.gabmatlowrate*al_0_0.2' '*dim_' num2str(dimensions(j))] , '_1.gabmatlowrate_' , ['*gabmatlowrate*al_0_0.2*dim_' num2str(dimensions(j))], modelsAll_bab_al_0_rho_02_vnoise_vnoiseGablowrate(k,:), indAll_whi_al_0_vnoise_vclean, 105) ; save(outFile1, 'postAll_bab_al_0_2_rho_02_allDim_majRulGablowrate_vn_vn');end;end


for j = 4; for k = 1 : 6; [postAll_bab_al_0_4_rho_02_allDim_majRulGablowrate_vn_vn(j,k,:) ads] = getPost_crossvalid_maj_fast(folder1BabbleGab(k).name, [ '*_1.gabmatlowrate*al_0_0.4' '*dim_' num2str(dimensions(j))] , '_1.gabmatlowrate_' , ['*gabmatlowrate*al_0_0.4*dim_' num2str(dimensions(j))], modelsAll_bab_al_0_rho_02_vnoise_vnoiseGablowrate(k,:), indAll_whi_al_0_vnoise_vclean, 105) ; save(outFile1, 'postAll_bab_al_0_4_rho_02_allDim_majRulGablowrate_vn_vn');end;end

for j = 4; for k = 1 : 6; [postAll_bab_al_0_6_rho_02_allDim_majRulGablowrate_vn_vn(j,k,:) ads] = getPost_crossvalid_maj_fast(folder1BabbleGab(k).name, [ '*_1.gabmatlowrate*al_0_0.6' '*dim_' num2str(dimensions(j))] , '_1.gabmatlowrate_' , ['*gabmatlowrate*al_0_0.6*dim_' num2str(dimensions(j))], modelsAll_bab_al_0_rho_02_vnoise_vnoiseGablowrate(k,:), indAll_whi_al_0_vnoise_vclean, 105) ; save(outFile2, 'postAll_bab_al_0_6_rho_02_allDim_majRulGablowrate_vn_vn');end;end

for j = 4; for k = 1 : 6; [postAll_bab_al_0_8_rho_02_allDim_majRulGablowrate_vn_vn(j,k,:) ads] = getPost_crossvalid_maj_fast(folder1BabbleGab(k).name, [ '*_1.gabmatlowrate*al_0_0.8' '*dim_' num2str(dimensions(j))] , '_1.gabmatlowrate_' , ['*gabmatlowrate*al_0_0.8*dim_' num2str(dimensions(j))], modelsAll_bab_al_0_rho_02_vnoise_vnoiseGablowrate(k,:), indAll_whi_al_0_vnoise_vclean, 105) ; save(outFile3, 'postAll_bab_al_0_8_rho_02_allDim_majRulGablowrate_vn_vn');end;end


for j = 4; for k = 1 : 6; [postAll_pin_al_0_2_rho_02_allDim_majRulGablowrate_vn_vn(j,k,:) ads] = getPost_crossvalid_maj_fast(folder1PinkGab(k).name, [ '*_1.gabmatlowrate*al_0_0.2' '*dim_' num2str(dimensions(j))] , '_1.gabmatlowrate_' , ['*gabmatlowrate*al_0_0.2*dim_' num2str(dimensions(j))], modelsAll_pin_al_0_rho_02_vnoise_vnoiseGablowrate(k,:), indAll_whi_al_0_vnoise_vclean, 105) ; save(outFile1, 'postAll_pin_al_0_2_rho_02_allDim_majRulGablowrate_vn_vn');end;end


for j = 4; for k = 1 : 6; [postAll_pin_al_0_4_rho_02_allDim_majRulGablowrate_vn_vn(j,k,:) ads] = getPost_crossvalid_maj_fast(folder1PinkGab(k).name, [ '*_1.gabmatlowrate*al_0_0.4' '*dim_' num2str(dimensions(j))] , '_1.gabmatlowrate_' , ['*gabmatlowrate*al_0_0.4*dim_' num2str(dimensions(j))], modelsAll_pin_al_0_rho_02_vnoise_vnoiseGablowrate(k,:), indAll_whi_al_0_vnoise_vclean, 105) ; save(outFile1, 'postAll_pin_al_0_4_rho_02_allDim_majRulGablowrate_vn_vn');end;end

for j = 4; for k = 1 : 6; [postAll_pin_al_0_6_rho_02_allDim_majRulGablowrate_vn_vn(j,k,:) ads] = getPost_crossvalid_maj_fast(folder1PinkGab(k).name, [ '*_1.gabmatlowrate*al_0_0.6' '*dim_' num2str(dimensions(j))] , '_1.gabmatlowrate_' , ['*gabmatlowrate*al_0_0.6*dim_' num2str(dimensions(j))], modelsAll_pin_al_0_rho_02_vnoise_vnoiseGablowrate(k,:), indAll_whi_al_0_vnoise_vclean, 105) ; save(outFile2, 'postAll_pin_al_0_6_rho_02_allDim_majRulGablowrate_vn_vn');end;end

for j = 4; for k = 1 : 6; [postAll_pin_al_0_8_rho_02_allDim_majRulGablowrate_vn_vn(j,k,:) ads] = getPost_crossvalid_maj_fast(folder1PinkGab(k).name, [ '*_1.gabmatlowrate*al_0_0.8' '*dim_' num2str(dimensions(j))] , '_1.gabmatlowrate_' , ['*gabmatlowrate*al_0_0.8*dim_' num2str(dimensions(j))], modelsAll_pin_al_0_rho_02_vnoise_vnoiseGablowrate(k,:), indAll_whi_al_0_vnoise_vclean, 105) ; save(outFile3, 'postAll_pin_al_0_8_rho_02_allDim_majRulGablowrate_vn_vn');end;end

for j = 4; for k = 1 : 6; [postAll_whi_al_0_2_rho_02_allDim_majRulGablowrate_vn_vn(j,k,:) ads] = getPost_crossvalid_maj_fast(whiteFolderList(k).name, [ '*_1.gabmatlowrate*al_0.2' '*dim_' num2str(dimensions(j))] , '_1.gabmatlowrate_' , ['*gabmatlowrate*al_0.2*dim_' num2str(dimensions(j))], modelsAll_whi_al_0_rho_02_vnoise_vnoiseGablowrate(k,:), indAll_whi_al_0_vnoise_vclean, 105) ; save(outFile1, 'postAll_whi_al_0_2_rho_02_allDim_majRulGablowrate_vn_vn');end;end


for j = 4; for k = 1 : 6; [postAll_whi_al_0_4_rho_02_allDim_majRulGablowrate_vn_vn(j,k,:) ads] = getPost_crossvalid_maj_fast(whiteFolderList(k).name, [ '*_1.gabmatlowrate*al_0.4' '*dim_' num2str(dimensions(j))] , '_1.gabmatlowrate_' , ['*gabmatlowrate*al_0.4*dim_' num2str(dimensions(j))], modelsAll_whi_al_0_rho_02_vnoise_vnoiseGablowrate(k,:), indAll_whi_al_0_vnoise_vclean, 105) ; save(outFile1, 'postAll_whi_al_0_4_rho_02_allDim_majRulGablowrate_vn_vn');end;end

for j = 4; for k = 1 : 6; [postAll_whi_al_0_6_rho_02_allDim_majRulGablowrate_vn_vn(j,k,:) ads] = getPost_crossvalid_maj_fast(whiteFolderList(k).name, [ '*_1.gabmatlowrate*al_0.6' '*dim_' num2str(dimensions(j))] , '_1.gabmatlowrate_' , ['*gabmatlowrate*al_0.6*dim_' num2str(dimensions(j))], modelsAll_whi_al_0_rho_02_vnoise_vnoiseGablowrate(k,:), indAll_whi_al_0_vnoise_vclean, 105) ; save(outFile2, 'postAll_whi_al_0_6_rho_02_allDim_majRulGablowrate_vn_vn');end;end

for j = 4; for k = 1 : 6; [postAll_whi_al_0_8_rho_02_allDim_majRulGablowrate_vn_vn(j,k,:) ads] = getPost_crossvalid_maj_fast(whiteFolderList(k).name, [ '*_1.gabmatlowrate*al_0.8' '*dim_' num2str(dimensions(j))] , '_1.gabmatlowrate_' , ['*gabmatlowrate*al_0.8*dim_' num2str(dimensions(j))], modelsAll_whi_al_0_rho_02_vnoise_vnoiseGablowrate(k,:), indAll_whi_al_0_vnoise_vclean, 105) ; save(outFile3, 'postAll_whi_al_0_8_rho_02_allDim_majRulGablowrate_vn_vn');end;end

