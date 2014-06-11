function [R fileout]= getPosterior(folder, ext, ext1, ext2,models, ind, dim)
folder
files = dir(fullfile(folder, ext));
[m1 n1] = size(files)
for j = 1 : m1;
	 index = strfind(files(j).name , ext1);
         files2 = dir(fullfile(folder, [files(j).name(1:index-1)  '*' ext2]));
         [m2 n2] = size(files2);
         for j3 = 1 : m2
		data1 = load([folder '/' files2(j3).name]);	
		data2 = unitseq(data1);
		datum(j).data(j3).val = data2'; 
	end
end

%data = [];
for j2 = 1 : 10
	 datum1 = datum( ind == j2);
	 [m1 n1] = size(datum1);
	for j1 = 1 : max(m1,n1)
	    [m2 n2] = size(datum1(j1).data);
		data = [];
		for j3 = 1 : max(m2,n2)
		     [d R(j2).val1(j1).val(j3)] =  models(j2).model.posterior(datum1(j1).data(j3).val);
		end
	end
end
fileout = 1;
%for j = 1 : 7; for k = 1 : 8; [postAll_whi_al_0_2_allDim_majRulMod_vnoise_vnoise filesAll_whi_al_0_2_majRul_vnoise_vnoise] = getPosterior_crossvalid_majority_mod(folder1White(k).name, [ '*' strings(k).name '_1*.matvnoise*whitefeat*al_2' '*dim_' num2str(dimensions(j))] , strings(k).name , ['.matvnoise*al_2*dim_' num2str(dimensions(j))], modelsAll_whi_al_0_vnoise_vnoise, indAll_whi_al_0_vnoise_vclean, 105) ;end;end

