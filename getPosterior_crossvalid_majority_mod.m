function [R fileout]= getPosterior(folder, ext, ext1, ext2,models, ind, dim)
folder
files = dir(fullfile(folder, ext));
[m1 n1] = size(files)
%for j = 1 : m1;
%	datum(j).val = load([folder '/' files(j).name]);
%end
%data = [];
parfor j2 = 1 : 10
	 files1 = files( ind == j2);
	 [m1 n1] = size(files1);
	for j1 = 1 : m1
	    index = strfind(files1(j1).name , ext1);
	    files2 = dir(fullfile(folder, [files1(j1).name(1:index-1)  '*' ext2]));
	    [m2 n2] = size(files2);
		data = [];
		for j3 = 1 : m2
		     data1 = load([folder '/' files2(j3).name]);
%		     fileout((j2-1)*60 + j1).val(j3).name = files2(j3).name;
 		     data2 = unitseq(data1);
		     data = [data; data2'];
%		     [d R1(j1)] = models(j2).model.posterior(data2');
		     [d R(j2).val1(j1).val(j3)] =  models(j2).model.posterior(data2');
		end
	end
%        R(j2).val = R1;
 %       clear R1;
end
fileout = 1;
%for j = 1 : 7; for k = 1 : 8; [postAll_whi_al_0_2_allDim_majRulMod_vnoise_vnoise filesAll_whi_al_0_2_majRul_vnoise_vnoise] = getPosterior_crossvalid_majority_mod(folder1White(k).name, [ '*' strings(k).name '_1*.matvnoise*whitefeat*al_2' '*dim_' num2str(dimensions(j))] , strings(k).name , ['.matvnoise*al_2*dim_' num2str(dimensions(j))], modelsAll_whi_al_0_vnoise_vnoise, indAll_whi_al_0_vnoise_vclean, 105) ;end;end

