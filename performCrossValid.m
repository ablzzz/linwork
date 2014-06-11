function R = performCrossValid(folder1, ext, extOut)
[m1 n1] = size(folder1);
for j1 = 1 : n1; 
	folder = folder1(j1).name;
	List = ([folder, '/list']);
	fid = fopen(List,'r');
	while ~feof(fid)
		f = fgets(fid);
		files = dir(fullfile(folder, ['*' f(1:length(f) -1) '*' ext]));
		[m n] = size(files);
		fOut = [];
		for j =  1 : m
%			[folder '/' files(j).name]
			temp = load([folder '/' files(j).name]);
			fOut = [fOut; temp];
		end
		fileOut = [folder '/' f(1:length(f) - 1) extOut];
		dlmwrite(fileOut, fOut);
	end
end
