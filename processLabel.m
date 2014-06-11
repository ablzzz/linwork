function R = processLabel(folder, ext)
files = dir(fullfile(folder , ext));
[m n] = size(files)
for j = 1 : m
	fid = fopen([folder  '/' files(j).name]); 
	c = textscan(fid, '%f %f %s', 'delimiter', ' ');
	startTime = c{1}; endTime = c{2} ; label = c{3};
        startFrame = round(startTime/0.25) ; 
        endFrame = round(endTime/0.25);
	Res = zeros(240,1);
	[m1 n1] = size(startFrame);
	endFrame(m1)
	size(Res)
	for j1 = 1 : m1
		if startFrame(j1) == 0
			startFrame(j1) = 1;
		end
		if endFrame(j1) == 0;
			endFrame(j1) = 1;
		end
		
		if strcmp(label(j1, :), 'nonspeech')
			Res(startFrame(j1) : endFrame(j1)) = 0;
		else 
			Res(startFrame(j1) : endFrame(j1)) = 1;
		end
	end
	
	Res1 = buffer(Res,4,3);
	temp = sum(Res1);
	Result(temp > 1) = 1;
	Result(temp <= 1) = 0;
	R(j,:) = Res';
%	R(j, :) = Result';
	save('Resd1.mat', 'R*');
end 
