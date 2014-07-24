function featForSpace  = createStepToneTorc(toneDiff, numOfInst)

%%% toneDiff is the number of bins to skip to create step Tone


startFreq = 180; %%% From wav2aud
endFreq = 7246;
stepSize = (log(endFreq) - log(startFreq))/128;

startTone = 200 : (5000 - 200)/numOfInst : 5000;
endTone = startTone*exp(toneDiff*stepSize);
torc = mvripfft(); 
k = 1;
%%%% creating step tone %%%%
t = [0 : 1/16384 : 0.5 - 1/16384];
for j = 1 : length(startTone); 
	tone1 = sin(2*pi*startTone(j)*t);
	tone2 = sin(2*pi*endTone(j)*t);
	toneClean = [tone1 tone2];
	gabFeatClean(j).val = extractGabFeature(toneClean);
	featForSpace(:,:,:,k) = gabFeatClean(j).val;
	k = k + 1;	
	for snr = -10:5:10; 
		toneTorcSNR = combineSNR(torc, toneClean', snr);
		gabFeatNoisy(j,k).val = extractGabFeature(toneTorcSNR);
		featForSpace(:,:,:,k) = gabFeatNoisy(j,k).val;
		k = k + 1;
	end
end

[tsvd_map]=tsvd_mod(featForSpace);
space = tsvd_map;
