function extractFeaturesWav(folder,dest_folder,ext, state,noise,snr)
  path(path,'/home/bellur/workspace/nsltools');
%  path(path,'/home/kpatil/Timbre/rastamat');
   %path(path,'/home/kpatil/Timbre/AuditoryToolbox');
%   fcoefs = MakeERBFilters(16000,420,100);
  rand('state',sum(100*clock));
  if nargin<6
    snr=0;
  else
    snr=str2num(snr);
    fprintf('%s = %2.0f dB\n',noise,snr);
  end
  if nargin < 5
    noise='none'
  end
  if nargin<4
    state='';
  end
  if nargin < 3
    error('Not enough inputs');
  end
  

  loadload;close;
  paras(1)=4;
  paras(2)=4;
  paras(4)=0;
  b=[1 -0.97]; a=[1];
  
  rv=2.^[2:0.5:7];
  % sv=2.^[-1:1];
  sv=2.^[-2:0.5:3];
  
  mkdir(dest_folder);
  d=dir(fullfile(folder,ext));

  %for k=1:length(d)
  rp=randperm(length(d));
%   for k=rp(1:10)
   for k=rp(1:500);
   %if rand<10/length(d)
    if(d(k).name(1)~='.')
      filename=[folder '/' d(k).name];
      dest_filename=[dest_folder '/' d(k).name];
      
      if (exist([dest_filename(1:end-3) 'mat'])==0)
	
	cr1=[];
	save([dest_filename(1:end-3) 'mat'], 'cr1')
% 	filename
%     fid = fopen(filename,'rb','b');
%     [x,cnt]= fread(fid, inf, 'int16');
%     fclose(fid);
%     fs = 16000;
	[x,fs]= wavread(filename);
	
	if (length(x)>0.1*fs)
	
	  x=resample(x,16000,fs);
          %x=add_noise(x,noise,snr);
	  x=filter(b,a,x);
	  x=unitseq(x);
%	  output=ERBFilterBank(x, fcoefs); % for gammatone filter output
%	  feat=mean(abs(output).^2,2);     % for gammatone filter output

%          y=wav2y1(x);             %for auditory filter output
%	  feat=mean(abs(y).^2,1);  %for auditory filter output 

%	  feat=abs(fft(x,1024)).^2;             % for fft .. change to 128 fft if required
%	  [feat,wts] = audspec(feat(:), 16000, 128, 'mel', 0, 8000, 1,1); % mel fft .. the fft should be 1024 
	  
	  %y=wav2aud(x,paras);
	  %cr1=mean(abs(y));
	  x=wind(x,16000);
      size(x)
%            y=wav2aud(x,paras);
%	    y=y.^(1/3);	  
%	    crtemp=aud2cor(y,[paras, 0 0 1],rv,sv,[dest_folder '/tmp' state],0);
%	    delete([dest_folder '/tmp' state]);
	    for i= 1:size(x,1)
	     y=wav2aud(x(i,:),paras);
	     y=y.^(1/3);
	      % y_mean=repmat(mean(y,1),[size(y,1),1]);
	      cr=aud2cor(y,[paras, 0 0 1],rv,sv,[dest_folder '/tmp' state],0);
	      delete([dest_folder '/tmp' state]);
	      %cr_mean=aud2cor(y_mean,[paras, 0 0 1],rv,sv,[dest_folder '/tmp' state],0);
	      %delete([dest_folder '/tmp' state]);
	      %cr=cr-cr_mean;
	      crtemp(:,:,i,:)=mean(abs(cr),3);
	    end
	    cr1=mean(crtemp,3);
	    %cr1=bin_cr(crtemp);
	    save([dest_filename(1:end-3) 'mat'], 'cr1')
	    clear x y cr crtemp cr1 feat;
	else
	  delete([dest_filename(1:end-3) 'mat']);
	end
      else
	disp(['already done' filename]);
      end
      %end
    end
   end
   

 function  cr1=bin_cr(crtemp)
  cr1=[];
   for i=0:64:64*18
    cr1(:,:,end+1,:)=mean(abs(crtemp(:,:,[1:64]+i,:)),3);
   end
   
