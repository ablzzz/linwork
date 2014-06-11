 %[Result_svm_cafe_nall_combinespec_lda_al_0_2, Result_svm_cafe_nall_combinespec_lda_al_0_4, Result_svm_cafe_nall_combinespec_lda_al_0_6] = runSVM(folderCafe, '*gabFeat.mat', model_svm_kernel0, GT_CAFE_CAFE_sB, ldaCafeAll)
%vsave('Result_svm_cafe_nall_combinespec.mat', 'Result_svm_cafe_nall_combinespec*')
[Result_svm_homeliving_nall_combinespec_lda_al_0_2, Result_svm_homeliving_nall_combinespec_lda_al_0_4, Result_svm_homeliving_nall_combinespec_lda_al_0_6] = runSVM(folderHomeLiving, '*gabFeat.mat', model_svm_kernel0, GT_Homeliving_sA, ldaHomeAll)
save('Result_svm_home_nall_combinespec.mat', 'Result_svm_homeliving_nall_combinespec*')

%[Result_svm_carwinup_nall_combinespec_lda_al_0_2, Result_svm_carwinup_nall_combinespec_lda_al_0_4, Result_svm_carwinup_nall_combinespec_lda_al_0_6] = runSVM(folderCarWinup, '*gabFeat.mat', model_svm_kernel0, GT_Carwinup_sA, ldaCarAll)

