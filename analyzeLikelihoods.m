function Res  = getClassificationQUT(noise, clean , GT)
[o p q] = size(noise);
for j = 1 : o; 
	speechClean = -clean(j,:,:);
	Res.speechC(j).val = speechClean(GT(j,:,1:237) == 1);
	noiseClean = -noise(j,:,:);
	Res.noiseC(j).val = noiseClean(GT(j,:,1:237) == 1);
end 
