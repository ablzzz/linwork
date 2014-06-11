function [R files]= getPosterior(folder, ext, models, ind, dim)
files = dir(fullfile(folder, ext));
[m1 n1] = size(files)
for j = 1 : m1;
	datum(j).val = load([folder '/' files(j).name]);
end
data = [];

for j2 = 1 : 10
	 testData = datum( ind == j2);
	 [m1 n1] = size(testData);
	for j1 = 1 : n1
	    data1 = testData(j1).val;
	    if length(data1) > 1
		data1 = buffer(data1,dim,0);
		[m2 n2] = size(data1);
		data = [];
		for j3 = 1 : n2
 		     data2 = unitseq(data1(:,j3));
		     data = [data; data2'];
%		     [d R1(j1)] = models(j2).model.posterior(data2');
		     [d R(j2).val1(j1).val(j3)] =  models(j2).model.posterior(data2');
		end
	    end
	end
%        R(j2).val = R1;
 %       clear R1;
end
