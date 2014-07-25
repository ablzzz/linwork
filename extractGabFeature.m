function [cr rt rsf] = extractSpikesFileName(y)
    linS = ones(1,8); 
    flag = 1;
    loadload;
    paras(1)=10;
    paras(2)=4;
    paras(4)=0;
    rv=2.^[1:1:5];
    sv=2.^[-2:1:3];
    %x = x();
    %x=unitseq(x);
    %fs = 16000;
    %y=wav2aud(x,paras);
    [m n] = size(linS)
  for j = 1 : m
    gab_filters = create_filters_ashwintilt(paras, linS, flag);
    cr=aud2cor_bf(y', gab_filters);
    cr = abs(cr);
    rt = squeeze(sum(abs(cr), 4));
    rsf = mean(squeeze(sum(abs(cr), 3)),4);
  end
   
