
function [R] = extractSpikesFileName(y, cr_t, rt_t, rsf_t, paraval)
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
        distval_cr_cos(j,1) = pdist2(abs(cr(:))' , abs(cr_t(:))', 'cosine');
	distval_rt_cos(j,1) = pdist2(abs(rt(:))', abs(rt_t(:))', 'cosine');
	distval_rsf_cos(j,1) = pdist2(abs(rsf(:))', abs(rsf_t(:))', 'cosine');
    end
    %[d postval] = model.posterior(featval);
    [ a b] = sort(distval_cr_cos); R.distval_cr_cos = distval_cr_cos; R.col_cr_cos = linS(b,:);
     [ a b] = sort(distval_rt_cos); R.distval_rt_cos = distval_rt_cos; R.col_rt_cos = linS(b,:);

   [ a b] = sort(distval_rsf_cos); R.distval_rsf_cos = distval_rsf_cos; R.col_rsf_cos = linS(b,:);


