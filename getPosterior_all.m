function R = getPosterior(folder, ext, models, ind, dim)
files = dir(fullfile(folder, ext));
[m1 n1] = size(files)
data = [];
for j2 = 1 : 10
	 testFiles = files( ind == j2);
	 [m1 n1] = size(testFiles);
	for j1 = 1 : m1
	    [folder '/' files(j1).name];
	    data1 = load([folder '/' testFiles(j1).name]);
	    if length(data1) > 1
		data1 = buffer(data1,dim,0);
		[m2 n2] = size(data1);
		data = [];
		for j3 = 1 : n2
 		     data2 = unitseq(data1(:,j3));
		     data = [data; data2'];
		end
		[d R1(j1)] = models(j2).model.posterior(data);
           end
	end
        R(j2).val = R1;
        clear R1;
end
