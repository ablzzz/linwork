function [avgData]=getSpace(folder, ext)
addpath /home/bellur/workspace/svd
%[m1 n1] = size(folder)
k=1;
for j1 = 1 : 1
files = dir(fullfile(folder, ext));
j1
[m n] = size(files)
%fileNum = 00;
	    if j1 < 8 
	     	fileNum = 1;
	    else 
		fileNum = 1;
	    end
	    for j = 1 : m
	    	[folder '/' files(j).name];
	        load([folder '/' files(j).name], '-mat'); 
	        [m2 n2] = size(gabFeat)
		temp = 0;
		for j2 = 1 : n2
       			temp  = temp + squeeze(gabFeat(j2).cr.crtemp1); 
		    	k=k+1;
		end
		avgData(j).dat = (1/n2)*temp;
	     end
end

