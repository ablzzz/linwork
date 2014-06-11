function weights = weightingRemNoise(folder, ext ,alpha,dim)
files = (dir(fullfile(folder, ext)));
[m n] = size(files);

for j1 = 1 : m; 
	a = load([folder '/' files(j1).name]); 
        [m1 n1] = size(a.gabFeat);  
	temp = 0; 
	for j = 1 : n1; 
		temp = temp + squeeze(a.gabFeat(j).cr.crtemp1); 
	end; 
	temp = temp/n1; 
%	weights=all_weights{dim}-min(all_weights{dim}(:));
% 	weights(j1).weight = alpha -alpha*(temp./max(temp(:))) ;	
	weights(j1).weight = temp;

end

