function [Result Result1 Result2] = runSvm(folder, ext, model, GT, mask)
for j = 1 : 5; 
	Result(j).R =   svmComputeResultsGabMask(folder(j).name, ext, model, GT, j+1, mask(j).lda.wproject_0_2(:)')
 	Result1(j).R =   svmComputeResultsGabMask(folder(j).name, ext, model, GT, j+1, mask(j).lda.wproject_0_4(:)')
	Result2(j).R =   svmComputeResultsGabMask(folder(j).name, ext, model, GT, j+1, mask(j).lda.wproject_0_6(:)')
%	Result3(j).R =   svmComputeResultsGabMask(folder(j).name, ext, model, GT, j+1, ones(size(mask2)))
end
