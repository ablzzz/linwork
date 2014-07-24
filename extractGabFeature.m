
function [rsf] = extractSpikesFileName(x)
    loadload;
    bw = 2*ones(1,8);
    wt = ones(1,8);
    paras = [10 4 0 0];;
    rv=2.^[1:1:5];
    sv=2.^[-2:1:3];
    x=unitseq(x);
    y=wav2aud(x,paras);
    %y = x;
    [m n] = size(bw);
    for j = 1 : m
    	gab_filters = create_filters_bf(paras,rv,sv, bw(j,:), wt);
    	cr=aud2cor_bf(y', gab_filters);
    	rt = squeeze(sum(abs(cr), 4));
    	rsf = mean(squeeze(sum(abs(cr), 3)),4);
   end
   
