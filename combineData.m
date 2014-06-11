function R = combineData(folder, ext1, ext2)
files = dir(fullfile(folder, ext1));
[m n] = size(files)
if m > 0
for j = 1 : m 
    fname = files(j).name(1 : length(files(j).name) -3)
    files2 = dir(fullfile(folder, [ fname ext2]));
    [m1 n1] = size(files2)
    if m1 > 0
    for k = 1 : m1 
        gabFeat(k).cr = load([folder '/' files2(k).name], '-mat');
    end
    save([folder '/' fname '_audcorFeat.mat'], 'gabFeat');
    end
end
end
R = 1;
