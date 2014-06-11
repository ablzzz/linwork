function R = getPosterior(folder, ext, model)
files = dir(fullfile(folder, ext));
[m1 n1] = size(files)
data = [];
for j1 = 1 : m1
    [folder '/' files(j1).name];
    data1 = load([folder '/' files(j1).name]);
    data1 = unitseq(data1);
    [d R(j1)] = model.posterior(data1');
end
