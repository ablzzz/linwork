function extractFeaturesFileName(folder, filename1,dest_folder,ext)
  path(path,'/shared/persisted/nsltools');
%path(path,'~/workspace/nsltools');
%  path(path,'/home/kpatil/Timbre/rastamat');
   %path(path,'/home/kpatil/Timbre/AuditoryToolbox');
%   fcoefs = MakeERBFilters(16000,420,100);
  rand('state',sum(100*clock));
  if nargin<7
    snr=0;
  else
    snr=str2num(snr);
    fprintf('%s = %2.0f dB\n',noise,snr);
  end
  if nargin < 6
    noise='none'
  end
  if nargin<5
    state='';
  end
  if nargin < 4
    error('Not enough inputs');
  end
  
filename1
  loadload;close;
  paras(1)=4;
  paras(2)=4;
  paras(4)=0;
  b=[1 -0.97]; a=[1];
  
  rv=2.^[1:0.5:5];
  % sv=2.^[-1:1];
  sv=2.^[-2:0.5:3];
  
%  mkdir(dest_folder);
%  d=dir(fullfile(folder,ext));
%size(d)
  %for k=1:length(d)
 % rp=randperm(length(d));
  % parfor k=rp
  % for k=rp;
   %if rand<10/length(d)
%    if(filename ~='.')
      filename=[folder '/' filename1]
      dest_filename=[dest_folder '/' filename1];
      
      if (exist([dest_filename(1:end-3) ext 'mat'])==0)
	
%	cr1=[];
%	save([dest_filename(1:end-3)  ext '.mat'], 'cr1')
	filename
    fid = fopen(filename,'rb','l');
    [x,cnt]= fread(fid, inf, 'int16');
    fclose(fid);
    fs = 16000;
	%[x,fs]= wavread(filename);
	
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
	    for i= 1:min(3,size(x,1))
	     y=wav2aud(x(i,:),paras);
	     y=y.^(1/3);
	      % y_mean=repmat(mean(y,1),[size(y,1),1]);
	      tempout = [dest_folder '/tmp' num2str(floor(100*rand(1)))];
	      cr=aud2cor(y,[paras, 0 0 1],rv,sv,tempout,0);
%	      delete(tempout);
	      %cr_mean=aud2cor(y_mean,[paras, 0 0 1],rv,sv,[dest_folder '/tmp' state],0);
	      %delete([dest_folder '/tmp' state]);
	      %cr=cr-cr_mean;
              crtemp1 = mean(abs(cr),3);
	      crtemp(:,:,i,:)=mean(abs(cr),3);
	      save([dest_filename(1:end-3) ext '_' num2str(i) '.mat'], 'crtemp1')
	    end
%	    cr1=mean(crtemp,3);
	    %cr1=bin_cr(crtemp);
%	    save([dest_filename(1:end-3) ext '.mat'], 'cr1')
	    clear x y cr crtemp cr1 feat crtemp1;
	else
	  delete([dest_filename(1:end-3) ext '.mat']);
	end
      else
	disp(['already done' filename]);
      end
      %end
 %   end
  % end
   

 function  cr1=bin_cr(crtemp)
  cr1=[];
   for i=0:64:64*18
    cr1(:,:,end+1,:)=mean(abs(crtemp(:,:,[1:64]+i,:)),3);
   end
   
