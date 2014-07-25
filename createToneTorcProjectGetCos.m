function [cleanTonePostVal torcTonePostVal]  = createStepToneTorc(toneDiff, numOfInst, model, space,  dim, paraval )
addpath '/shared/persisted/nsltools/'
%%% toneDiff is the number of bins to skip to create step Tone


startFreq = 180; %%% From wav2aud
endFreq = 7246;
stepSize = (log(endFreq) - log(startFreq))/128;

%startTone = 200 : (5000 - 200)/numOfInst : 5000;
startTone = 400;
endTone = startTone*exp(toneDiff*stepSize);
torc = mvripfft(); 
k = 1;
loadload;
%%%% creating step tone %%%%
t = [0 : 1/16384 : 0.5 - 1/16384];
for j = 1 : length(startTone); 
	tone1 = sin(2*pi*startTone(j)*t);
	tone2 = sin(2*pi*endTone(j)*t);
	toneClean1 = [tone1 tone2];
	toneClean = unitseq(toneClean1);
	toneCleanAud = wav2aud(toneClean, [10 4 0 0]);
	[cleanTonePostVal(j).prob cleanTonePostVal(j).sorted]  = extractGabFeatureProjectGetPost(toneCleanAud, model, space, dim, paraval);
	k =  1;
	for snr = -10:5:10; 
		toneTorcSNR = combineSNR(torc, toneClean1', snr);
		toneTorcSNR = unitseq(toneTorcSNR);
		toneTorcSNRAud = wav2aud(toneTorcSNR, [10 4 0 0]);
		[torcTonePostVal(j,k).prob torcTonePostVal(j,k).sorted]  = extractGabFeatureProjectGetPost(toneTorcSNRAud, model, space, dim, paraval);
		[j k]
		k = k + 1;
	end
end

