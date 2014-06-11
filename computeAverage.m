 function temp = computeAverage(folder, ext)
%1 scale
%2 rate
%3 freq
%4 cube

files = dir(fullfile(folder, ext));
[m n] = size(files);
%sumAll = [];
for j = 1 : m
%    [folder '/' files(j).name]
    obj=load([folder '/' files(j).name]);
    obj.cr1 = obj.crtemp1;
    cr1 = squeeze(obj.cr1);
    cr_size =size(cr1);
    if j == 1
        sumAll = cr1;
    else
        try
        sumAll = sumAll + cr1;
        catch
        a = 1;
        end
   end
end
temp = sumAll/m;


