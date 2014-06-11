for k = 1 : 8; [postAll_bab_al_0_allDim_majRulModGablowrate_vnoise_vnoise(1,k,:) filesAll_bab_al_0_2_majRulGab_vnoise_vnoise(j,k,:)] = getPosterior_crossvalid_majority_mod(folder1BabbleGab(k).name, [ '*_1.gabmatlowrate_bab_*al_0'] , '_1.gabmatlowrate' , ['*gabmatlowrate_bab_*al_0'], modelsAll_bab_al_0_vnoise_vnoiseGablowrate, indAll_whi_al_0_vnoise_vclean, 105) ;end;

for k = 1 : 8; [postAll_pin_al_0_allDim_majRulModGablowrate_vnoise_vnoise(1,k,:) filesAll_pin_al_0_2_majRulGab_vnoise_vnoise(1,k,:)] = getPosterior_crossvalid_majority_mod(folder1PinkGab(k).name, [ '*_1.gabmatlowrate_pink_*al_0'] , '_1.gabmatlowrate' , ['*gabmatlowrate_pink_*al_0'], modelsAll_pin_al_0_vnoise_vnoiseGablowrate, indAll_whi_al_0_vnoise_vclean, 105) ;end;
save gab3Run.mat

