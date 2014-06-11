for j = 1 : 7; for k = 1 : 8; [postAll_whi_al_0_4_allDim_majRulModGab_vnoise_vclean filesAll_whi_al_0_4_majRulGab_vnoise_vclean] = getPosterior_crossvalid_majority_mod(folder1WhiteGab(k).name, [ '*_1.gabmat*al_0.4' '*dim_' num2str(dimensions(j))] , '_1.gabmat' , ['*gabmat*al_0.4*dim_' num2str(dimensions(j))], modelsAll_whi_al_0_vnoise_vcleanGab, indAll_whi_al_0_vnoise_vclean, 105) ;end;end

for j = 1 : 7; for k = 1 : 8; [postAll_whi_al_0_6_allDim_majRulModGab_vnoise_vclean filesAll_whi_al_0_6_majRulGab_vnoise_vclean] = getPosterior_crossvalid_majority_mod(folder1WhiteGab(k).name, [ '*_1.gabmat*al_0.6' '*dim_' num2str(dimensions(j))] , '_1.gabmat' , ['*gabmat*al_0.6*dim_' num2str(dimensions(j))], modelsAll_whi_al_0_vnoise_vcleanGab, indAll_whi_al_0_vnoise_vclean, 105) ;end;end

for j = 1 : 7; for k = 1 : 8; [postAll_whi_al_0_8_allDim_majRulModGab_vnoise_vclean filesAll_whi_al_0_8_majRulGab_vnoise_vclean] = getPosterior_crossvalid_majority_mod(folder1WhiteGab(k).name, [ '*_1.gabmat*al_0.8' '*dim_' num2str(dimensions(j))] , '_1.gabmat' , ['*gabmat*al_0.8*dim_' num2str(dimensions(j))], modelsAll_whi_al_0_vnoise_vcleanGab, indAll_whi_al_0_vnoise_vclean, 105) ;end;end

for j = 1 : 7; for k = 1 : 8; [postAll_whi_al_0_2_allDim_majRulModGab_vnoise_vclean filesAll_whi_al_0_2_majRulGab_vnoise_vclean] = getPosterior_crossvalid_majority_mod(folder1WhiteGab(k).name, [ '*_1.gabmat*al_0.2' '*dim_' num2str(dimensions(j))] , '_1.gabmat' , ['*gabmat*al_0.2*dim_' num2str(dimensions(j))], modelsAll_whi_al_0_vnoise_vcleanGab, indAll_whi_al_0_vnoise_vclean, 105) ;end;end


