
 function [weights avgWeight] = get_weights(folder, ext ,alpha,dim)  
%1 scale
%2 rate
%3 freq
%4 cube
 
files = dir(fullfile(folder, ext));
[m n] = size(files)
%sumAll = [];
for j = 1 : m
%    [folder '/' files(j).name]
    obj=load([folder '/' files(j).name], '-mat');
    [q1 w1 e1 r1] = size(obj.crtemp1);
    obj.cr1 = obj.crtemp1(:,:,e1,:); 
    cr1 = squeeze(obj.cr1);
    cr_size =size(cr1);
    if j == 1
	sumAll = cr1;
    else
	try
	sumAll = sumAll + cr1;
	catch
	a = 1;
	end
   end
end
temp = sumAll/m;      
avgWeight = temp;
size(temp);
all_weights{1}=[];all_weights{1}=squeeze(mean(mean(temp,2),3));
all_weights{2}=[];all_weights{2}=squeeze(mean(mean(temp,1),3));
all_weights{3}=[];all_weights{3}=squeeze(mean(mean(temp,1),2));
all_weights{4}=temp;



% cr_size=[11 20 128];
% red_dim=[3 5 8];
 
% load(['/shared/persisted/weights/' target '_weights.mat'],'all_weights');
 
 if dim <=4
    weights=all_weights{dim}-min(all_weights{dim}(:));
    weights=alpha*(weights./max(weights(:)))+(1-alpha);
    %weights=alpha*(weights./max(weights(:)))+1-(alpha/2);
    if dim<4
      rep_size=cr_size;
      rep_size(dim)=1;
      weights=repmat(shiftdim(weights(:),1-dim),rep_size);
    end
  end
  if dim >4 && dim <=7
    rep_size=[1 1 1];
    rep_size(dim-4)=cr_size(dim-4);
    weights=repmat(mean(all_weights{4},dim-4),rep_size);
    weights=weights-min(weights(:));
    weights=alpha*(weights./max(weights(:)))+(1-alpha);
  end
  if dim==8
    load(['/export/kpatil/bbc/alpha_list/weight/alpha_list.mat']);
    aa=alpha_list(alpha,:);
    weights=ones(cr_size);
    for ii=1:3
       rep_size=cr_size;
      rep_size(ii)=1;
      temp=all_weights{ii}-min(all_weights{ii}(:));
      temp=aa(ii)*(temp./max(temp(:)))+(1-aa(ii));
      weights=weights.*repmat(shiftdim(temp(:),1-ii),rep_size);
    end
  end
    
