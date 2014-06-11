function [temp]=getSpace(folder, ext)
addpath /home/bellur/workspace/svd
[m1 n1] = size(folder)
k=1;
temp = 0;
for j1 = 1 : n1
files = dir(fullfile(folder(j1).name, ext));
j1
[m n] = size(files)
%fileNum = 00;
	    if j1 < 8 
	     	fileNum = 40;
	    else 
		fileNum = 40;
	    end
	    for j = 1 : fileNum
	    	[folder(j1).name '/' files(j).name];
	        load([folder(j1).name '/' files(j).name], '-mat'); 
	        [m2 n2] = size(gabFeat)
		for j2 = 1 : n2
       			temp =  temp + squeeze(gabFeat(j2).cr.crtemp1); 
		    	k=k+1;
		end
	     end
end
temp = temp/k;
