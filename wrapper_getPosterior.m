addpath /shared/persisted/nsltools
load('/shared/persisted/gab4Run');
load('/shared/persisted/folder3List.mat');
load('/shared/persisted/whiteModelsAdapt.mat');
outFile = '/shared/persisted/out2.mat';
outFile1 = '/shared/persisted/out3.mat';
outFile2 = '/shared/persisted/out4.mat';
outFile3 = '/shared/persisted/out5.mat';

for j = 4; for k = 1 : 6; [postAll_whi_al_0_4_rho_02_allDim_majRulGablowrate_vn_vn(j,k,:) ads] = getPosterior_crossvalid_majority_mod(folder3List(k).name, [ '*_1.gabmatlowrate*al_0.4' '*dim_' num2str(dimensions(j))] , '_1.gabmatlowrate_' , ['*gabmatlowrate*al_0.4*dim_' num2str(dimensions(j))], modelsAll_whi_al_0_rho_02_vnoise_vnoiseGablowrate(k,:), indAll_whi_al_0_vnoise_vclean, 105) ; save(outFile1, 'postAll_whi_al_0_4_rho_02_allDim_majRulGablowrate_vn_vn');end;end

for j = 4; for k = 1 : 6; [postAll_whi_al_0_6_rho_02_allDim_majRulGablowrate_vn_vn(j,k,:) ads] = getPosterior_crossvalid_majority_mod(folder3List(k).name, [ '*_1.gabmatlowrate*al_0.6' '*dim_' num2str(dimensions(j))] , '_1.gabmatlowrate_' , ['*gabmatlowrate*al_0.6*dim_' num2str(dimensions(j))], modelsAll_whi_al_0_rho_02_vnoise_vnoiseGablowrate(k,:), indAll_whi_al_0_vnoise_vclean, 105) ; save(outFile2, 'postAll_whi_al_0_6_rho_02_allDim_majRulGablowrate_vn_vn');end;end

for j = 4; for k = 1 : 6; [postAll_whi_al_0_8_rho_02_allDim_majRulGablowrate_vn_vn(j,k,:) ads] = getPosterior_crossvalid_majority_mod(folder3List(k).name, [ '*_1.gabmatlowrate*al_0.8' '*dim_' num2str(dimensions(j))] , '_1.gabmatlowrate_' , ['*gabmatlowrate*al_0.8*dim_' num2str(dimensions(j))], modelsAll_whi_al_0_rho_02_vnoise_vnoiseGablowrate(k,:), indAll_whi_al_0_vnoise_vclean, 105) ; save(outFile3, 'postAll_whi_al_0_8_rho_02_allDim_majRulGablowrate_vn_vn');end;end

for j = 1 : 7; for k = 1 : 6; [postAll_whi_al_0_2_rho_005_allDim_majRulGablowrate_vn_vn(j,k,:) ads] = getPosterior_crossvalid_majority_mod(folder3List(k).name, [ '*_1.gabmatlowrate*al_0.2' '*dim_' num2str(dimensions(j))] , '_1.gabmatlowrate_' , ['*gabmatlowrate*al_0.2*dim_' num2str(dimensions(j))], modelsAll_whi_al_0_rho_005_vnoise_vnoiseGablowrate(k,:), indAll_whi_al_0_vnoise_vclean, 105) ; save(outFile1, 'postAll_whi_al_0_2_rho_005_allDim_majRulGablowrate_vn_vn');end;end

for j = 1 : 7; for k = 1 : 6; [postAll_whi_al_0_4_rho_005_allDim_majRulGablowrate_vn_vn(j,k,:) ads] = getPosterior_crossvalid_majority_mod(folder3List(k).name, [ '*_1.gabmatlowrate*al_0.4' '*dim_' num2str(dimensions(j))] , '_1.gabmatlowrate_' , ['*gabmatlowrate*al_0.4*dim_' num2str(dimensions(j))], modelsAll_whi_al_0_rho_005_vnoise_vnoiseGablowrate(k,:), indAll_whi_al_0_vnoise_vclean, 105) ; save(outFile1, 'postAll_whi_al_0_4_rho_005_allDim_majRulGablowrate_vn_vn');end;end

for j = 1 : 7; for k = 1 : 6; [postAll_whi_al_0_6_rho_005_allDim_majRulGablowrate_vn_vn(j,k,:) ads] = getPosterior_crossvalid_majority_mod(folder3List(k).name, [ '*_1.gabmatlowrate*al_0.6' '*dim_' num2str(dimensions(j))] , '_1.gabmatlowrate_' , ['*gabmatlowrate*al_0.6*dim_' num2str(dimensions(j))], modelsAll_whi_al_0_rho_005_vnoise_vnoiseGablowrate(k,:), indAll_whi_al_0_vnoise_vclean, 105) ; save(outFile2, 'postAll_whi_al_0_6_rho_005_allDim_majRulGablowrate_vn_vn');end;end

for j = 1 : 7; for k = 1 : 6; [postAll_whi_al_0_8_rho_005_allDim_majRulGablowrate_vn_vn(j,k,:) ads] = getPosterior_crossvalid_majority_mod(folder3List(k).name, [ '*_1.gabmatlowrate*al_0.8' '*dim_' num2str(dimensions(j))] , '_1.gabmatlowrate_' , ['*gabmatlowrate*al_0.8*dim_' num2str(dimensions(j))], modelsAll_whi_al_0_rho_005_vnoise_vnoiseGablowrate(k,:), indAll_whi_al_0_vnoise_vclean, 105) ; save(outFile3, 'postAll_whi_al_0_8_rho_005_allDim_majRulGablowrate_vn_vn');end;end

for j = 1 : 7; for k = 1 : 6; [postAll_whi_al_0_2_rho_01_allDim_majRulGablowrate_vn_vn(j,k,:) ads] = getPosterior_crossvalid_majority_mod(folder3List(k).name, [ '*_1.gabmatlowrate*al_0.2' '*dim_' num2str(dimensions(j))] , '_1.gabmatlowrate_' , ['*gabmatlowrate*al_0.2*dim_' num2str(dimensions(j))], modelsAll_whi_al_0_rho_01_vnoise_vnoiseGablowrate(k,:), indAll_whi_al_0_vnoise_vclean, 105) ; save(outFile1, 'postAll_whi_al_0_2_rho_01_allDim_majRulGablowrate_vn_vn');end;end

for j = 1 : 7; for k = 1 : 6; [postAll_whi_al_0_4_rho_01_allDim_majRulGablowrate_vn_vn(j,k,:) ads] = getPosterior_crossvalid_majority_mod(folder3List(k).name, [ '*_1.gabmatlowrate*al_0.4' '*dim_' num2str(dimensions(j))] , '_1.gabmatlowrate_' , ['*gabmatlowrate*al_0.4*dim_' num2str(dimensions(j))], modelsAll_whi_al_0_rho_01_vnoise_vnoiseGablowrate(k,:), indAll_whi_al_0_vnoise_vclean, 105) ; save(outFile1, 'postAll_whi_al_0_4_rho_01_allDim_majRulGablowrate_vn_vn');end;end

for j = 1 : 7; for k = 1 : 6; [postAll_whi_al_0_6_rho_01_allDim_majRulGablowrate_vn_vn(j,k,:) ads] = getPosterior_crossvalid_majority_mod(folder3List(k).name, [ '*_1.gabmatlowrate*al_0.6' '*dim_' num2str(dimensions(j))] , '_1.gabmatlowrate_' , ['*gabmatlowrate*al_0.6*dim_' num2str(dimensions(j))], modelsAll_whi_al_0_rho_01_vnoise_vnoiseGablowrate(k,:), indAll_whi_al_0_vnoise_vclean, 105) ; save(outFile2, 'postAll_whi_al_0_6_rho_01_allDim_majRulGablowrate_vn_vn');end;end

for j = 1 : 7; for k = 1 : 6; [postAll_whi_al_0_8_rho_01_allDim_majRulGablowrate_vn_vn(j,k,:) ads] = getPosterior_crossvalid_majority_mod(folder3List(k).name, [ '*_1.gabmatlowrate*al_0.8' '*dim_' num2str(dimensions(j))] , '_1.gabmatlowrate_' , ['*gabmatlowrate*al_0.8*dim_' num2str(dimensions(j))], modelsAll_whi_al_0_rho_01_vnoise_vnoiseGablowrate(k,:), indAll_whi_al_0_vnoise_vclean, 105) ; save(outFile3, 'postAll_whi_al_0_8_rho_01_allDim_majRulGablowrate_vn_vn');end;end

for j = 1 : 7; for k = 1 : 6; [postAll_whi_al_0_2_rho_03_allDim_majRulGablowrate_vn_vn(j,k,:) ads] = getPosterior_crossvalid_majority_mod(folder3List(k).name, [ '*_1.gabmatlowrate*al_0.2' '*dim_' num2str(dimensions(j))] , '_1.gabmatlowrate_' , ['*gabmatlowrate*al_0.2*dim_' num2str(dimensions(j))], modelsAll_whi_al_0_rho_03_vnoise_vnoiseGablowrate(k,:), indAll_whi_al_0_vnoise_vclean, 105) ; save(outFile1, 'postAll_whi_al_0_2_rho_03_allDim_majRulGablowrate_vn_vn');end;end

for j = 1 : 7; for k = 1 : 6; [postAll_whi_al_0_4_rho_03_allDim_majRulGablowrate_vn_vn(j,k,:) ads] = getPosterior_crossvalid_majority_mod(folder3List(k).name, [ '*_1.gabmatlowrate*al_0.4' '*dim_' num2str(dimensions(j))] , '_1.gabmatlowrate_' , ['*gabmatlowrate*al_0.4*dim_' num2str(dimensions(j))], modelsAll_whi_al_0_rho_03_vnoise_vnoiseGablowrate(k,:), indAll_whi_al_0_vnoise_vclean, 105) ; save(outFile1, 'postAll_whi_al_0_4_rho_03_allDim_majRulGablowrate_vn_vn');end;end

for j = 1 : 7; for k = 1 : 6; [postAll_whi_al_0_6_rho_03_allDim_majRulGablowrate_vn_vn(j,k,:) ads] = getPosterior_crossvalid_majority_mod(folder3List(k).name, [ '*_1.gabmatlowrate*al_0.6' '*dim_' num2str(dimensions(j))] , '_1.gabmatlowrate_' , ['*gabmatlowrate*al_0.6*dim_' num2str(dimensions(j))], modelsAll_whi_al_0_rho_03_vnoise_vnoiseGablowrate(k,:), indAll_whi_al_0_vnoise_vclean, 105) ; save(outFile2, 'postAll_whi_al_0_6_rho_03_allDim_majRulGablowrate_vn_vn');end;end

for j = 1 : 7; for k = 1 : 6; [postAll_whi_al_0_8_rho_03_allDim_majRulGablowrate_vn_vn(j,k,:) ads] = getPosterior_crossvalid_majority_mod(folder3List(k).name, [ '*_1.gabmatlowrate*al_0.8' '*dim_' num2str(dimensions(j))] , '_1.gabmatlowrate_' , ['*gabmatlowrate*al_0.8*dim_' num2str(dimensions(j))], modelsAll_whi_al_0_rho_03_vnoise_vnoiseGablowrate(k,:), indAll_whi_al_0_vnoise_vclean, 105) ; save(outFile3, 'postAll_whi_al_0_8_rho_03_allDim_majRulGablowrate_vn_vn');end;end

for j = 1 : 7; for k = 1 : 6; [postAll_whi_al_0_2_rho_04_allDim_majRulGablowrate_vn_vn(j,k,:) ads] = getPosterior_crossvalid_majority_mod(folder3List(k).name, [ '*_1.gabmatlowrate*al_0.2' '*dim_' num2str(dimensions(j))] , '_1.gabmatlowrate_' , ['*gabmatlowrate*al_0.2*dim_' num2str(dimensions(j))], modelsAll_whi_al_0_rho_04_vnoise_vnoiseGablowrate(k,:), indAll_whi_al_0_vnoise_vclean, 105) ; save(outFile1, 'postAll_whi_al_0_2_rho_04_allDim_majRulGablowrate_vn_vn');end;end

for j = 1 : 7; for k = 1 : 6; [postAll_whi_al_0_4_rho_04_allDim_majRulGablowrate_vn_vn(j,k,:) ads] = getPosterior_crossvalid_majority_mod(folder3List(k).name, [ '*_1.gabmatlowrate*al_0.4' '*dim_' num2str(dimensions(j))] , '_1.gabmatlowrate_' , ['*gabmatlowrate*al_0.4*dim_' num2str(dimensions(j))], modelsAll_whi_al_0_rho_04_vnoise_vnoiseGablowrate(k,:), indAll_whi_al_0_vnoise_vclean, 105) ; save(outFile1, 'postAll_whi_al_0_4_rho_04_allDim_majRulGablowrate_vn_vn');end;end

for j = 1 : 7; for k = 1 : 6; [postAll_whi_al_0_6_rho_04_allDim_majRulGablowrate_vn_vn(j,k,:) ads] = getPosterior_crossvalid_majority_mod(folder3List(k).name, [ '*_1.gabmatlowrate*al_0.6' '*dim_' num2str(dimensions(j))] , '_1.gabmatlowrate_' , ['*gabmatlowrate*al_0.6*dim_' num2str(dimensions(j))], modelsAll_whi_al_0_rho_04_vnoise_vnoiseGablowrate(k,:), indAll_whi_al_0_vnoise_vclean, 105) ; save(outFile2, 'postAll_whi_al_0_6_rho_04_allDim_majRulGablowrate_vn_vn');end;end

for j = 1 : 7; for k = 1 : 6; [postAll_whi_al_0_8_rho_04_allDim_majRulGablowrate_vn_vn(j,k,:) ads] = getPosterior_crossvalid_majority_mod(folder3List(k).name, [ '*_1.gabmatlowrate*al_0.8' '*dim_' num2str(dimensions(j))] , '_1.gabmatlowrate_' , ['*gabmatlowrate*al_0.8*dim_' num2str(dimensions(j))], modelsAll_whi_al_0_rho_04_vnoise_vnoiseGablowrate(k,:), indAll_whi_al_0_vnoise_vclean, 105) ; save(outFile3, 'postAll_whi_al_0_8_rho_04_allDim_majRulGablowrate_vn_vn');end;end

