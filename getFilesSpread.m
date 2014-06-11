function R = getFilesSpread(folder, ext, ind)
files = dir(fullfile(folder, ext));
[m1 n1] = size(files)
%for j = 1 : m1;
 %       datum(j).val = load([folder '/' files(j).name]);
%end
%data = [];

for j2 = 1 : 10
	 ind1 = (j2 -1)*60+1;
	 ind2 = 60*j2;
         fileList(ind1 : ind2) = files( ind == j2);
end
R = fileList;
