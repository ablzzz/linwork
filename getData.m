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
	     	fileNum = 2000;
	    else 
		fileNum = 2000;
	    end
	    for j = 1 : fileNum
	    	[folder(j1).name '/' files(j).name];
	        a1=load([folder(j1).name '/' files(j).name], '-mat'); 
%	        a1.cr1 = a1.crtemp;
	        [o p q r] = size(a1.crtemp1);
%		a1.cr1 = a1.crtmp(:,:,q,:);
%	        if o > 0
%		size(squeeze(a1.crtemp))
       		temp = temp + squeeze(a1.crtemp1); 
	    	k=k+1;
%	        end
	     end
end

