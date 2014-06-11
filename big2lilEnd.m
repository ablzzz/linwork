function R = big2lilEnd(inFolder, outFolder)
files = dir(fullfile(inFolder,'*.raw'));
[m1 n1] =size(files);
for j =  1 : m1;
	fid = fopen([inFolder '/' files(j).name],'rb','b');
	[x,cnt]= fread(fid, inf, 'int16');
	fclose(fid);
	fid1 = fopen([outFolder '/' files(j).name],'w','l');
	fwrite(fid1,x,'int16');
	fclose(fid1);
end
R = 1;
