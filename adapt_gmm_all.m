function adapt_objs=adapt_gmm(objs,adaptFolder, ext ,rho, ind, dim)
files = dir(fullfile(adaptFolder, ext));
[m1 n1] =size(files)
adapt_data=[];
for j1 = 1 : 10
	j1
	adapFiles = files( ind ~= j1);
	adapt_data = [];
for j = 1 : 100
	temp = load([adaptFolder '/' adapFiles(j).name]);
	temp = unitseq(temp);
	%temp1 = buffer(temp, dim, 0);
%	[m1 n1] = size(temp1);
%for j2 = 1 : n1
%	temp2 = unitseq(temp1(:,j2));
		adapt_data = vertcat(adapt_data ,  temp');
%end
%clear temp;
end
size(adapt_data);
obj = objs(j1).model;
post_prob=obj.posterior(adapt_data);

n_i=sum(post_prob,1);

for i=1:obj.NComponents
    if n_i(i)~=0
    exp_x(i,:)=sum(repmat(post_prob(:,i),1,obj.NDimensions).*adapt_data)./n_i(i);
    else
        exp_x(i,:)=sum(repmat(post_prob(:,i),1,obj.NDimensions).*adapt_data).*0;
    end
end

alpha_i=n_i./(n_i+rho);

adapt_obj=obj;
mu=[];
for i=1:obj.NComponents
    mu(i,:)=alpha_i(i)*exp_x(i,:)+(1-alpha_i(i))*obj.mu(i,:);
end

if 1
PComponents=alpha_i.*(n_i./sum(n_i))+(1-alpha_i).*obj.PComponents;
PComponents=PComponents./sum(PComponents);
else
PComponents=obj.PComponents;
end
adapt_objs(j1).model=gmdistribution(mu,obj.Sigma,PComponents);
end	
