function adapt_obj=adapt_gmm(obj,adaptFolder, ext ,rho,dim)
files = dir(fullfile(adaptFolder, ext));
[m1 n1] =size(files);
adapt_data=[];
for j = 1 : 50
	temp1 = load([adaptFolder '/' files(j).name]);
	temp1 = buffer(temp1, dim, 0);
	[m3 n3] = size(temp1);
	for j3 = 1 : n3
	temp = unitseq(temp1(:,j3));
	adapt_data = vertcat(adapt_data ,  temp');
	clear temp;
	end
end
size(adapt_data)

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
adapt_obj=gmdistribution(mu,obj.Sigma,PComponents);

