function [Result Result1 Result2 Result3] = runSvm(folder, ext, model, GT, mask, mask1, mask2)
for j = 1 : 5; 
	Result(j).R =   svmCompileResults(folder(j).name, ext, model, GT, j+1, mask)
 	Result1(j).R =   svmCompileResults(folder(j).name, ext, model, GT, j+1, mask1)
	Result2(j).R =   svmCompileResults(folder(j).name, ext, model, GT, j+1, mask2)
	Result3(j).R =   svmCompileResults(folder(j).name, ext, model, GT, j+1, ones(size(mask2)))
end
