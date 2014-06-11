function R = getPosterior_QUT(folder, ext, model)

files = dir(fullfile(folder, ext));
[m1 n1] = size(files)
data = [];
for j1 = 1 : m1
    [folder '/' files(j1).name];
    load([folder '/' files(j1).name], '-mat');
    [m2 n2] = size(features)
    for j = 1 : m2;
	    data1 = unitseq(features(j,:)');
	    [d R(j1,j)] = model.posterior(data1');
    end
end
