
function [postval sortedLinS] = extractSpikesFileName(y, model, space, dim, paraval)
    linS = paraval.linS;
    flag = paraval.flag;
    loadload;
    paras = [10 4 0 0];
    rv=2.^[1:1:5];
    sv=2.^[-2:1:3];
    %x=unitseq(x);
    %y=wav2aud(x,paras);
    %y = x;
    [m n] = size(linS)
    parfor j = 1 : m
    	gab_filters = create_filters_ashwintilt(paras,rv,sv, linS(j,:), flag);
    	cr=aud2cor_bf(y', gab_filters);
    	rt = squeeze(sum(abs(cr), 4));
    	rsf = mean(squeeze(sum(abs(cr), 3)),4);
        rsf = rsf - space.mean;
        rsf = tmuln(rsf,space.U{1}(:,:)',1);
        rsf = tmuln(rsf,space.U{2}(:,:)',2);
        rsf = tmuln(rsf,space.U{3}(:,:)',3);
        rsf=rsf(1:dim(1),1:dim(2), 1:dim(3));
        feat=rsf(:);
        feat = unitseq(feat)';
	[a1 postval(j)] = model.posterior(feat);
    end
    %[d postval] = model.posterior(featval);
    [ a b] = sort(postval);
    sortedLinS = linS(b, :);  
