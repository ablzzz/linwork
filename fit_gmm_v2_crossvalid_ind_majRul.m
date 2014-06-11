function [models ind] = fit_gmm_v2_crossvalid_ind_majRul(folder, ext, ext1, ext2, dim, ind,use_kmeans_init, k_idx, cov_type)
addpath ~/workspace/nsltools
files = dir(fullfile(folder, ext));
[m1 n1] = size(files)
%ind = crossvalind('kfold', m1 , 10);
for j2 = 1 : 10
	testFiles = files( ind == j2);
	trainFiles = files( ind ~= j2);
	[m2 n2] = size(trainFiles)
	data = [];
	po = 0;
	for j1 = 1 : m2
		index = strfind(trainFiles(j1).name , ext1);
                files2 = dir(fullfile(folder, [trainFiles(j1).name(1:index-1)  '*' ext2]));
		[m3 n3] = size(files2);
               	for j3 = 1 : m3;	
			data1 = load([folder '/' files2(j3).name]);
    			data2 = unitseq(data1);
    			data = vertcat(data, data2');
			po = po+1;
		end
	end
	po
	size(data)
	if nargin < 7
    		use_kmeans_init = 0;
	    	k_idx = 2:15;
    		cov_type = 'diag';
	elseif nargin < 8
    		k_idx = 2:15;
		    cov_type = 'diag';
	elseif nargin < 9
    		cov_type = 'diag';
	end

	options = statset('Display', 'off', 'maxiter', 500);
	num_replicates = 3;
	max_err_cnt = 20;

% find best model order
	INT_MODELS = cell(length(k_idx),1);	
	B = zeros(length(k_idx),1);
	ERR_CNT = zeros(length(k_idx),1);
	for kk = 1:length(k_idx)
		 fprintf('Fitting GMM for k = %i ...\n', k_idx(kk))
    % initialize clusters using k-means
	    if use_kmeans_init
      		num_replicates = 1;
	        mu = zeros(k_idx(kk),size(data,2));
        %         Sigma = zeros(size(data,2),size(data,2),kk);
        	Sigma = [];
	        PComponents=zeros(1,k_idx(kk));
        	C = kmeans(data,k_idx(kk));
	        init=C';
	    else
        	init = 'randsample';
	    end
    
    % do GMM fit
    %     warning off
	    err_cnt = 0;
	    try
        	model = gmdistribution.fit(data, k_idx(kk), 'options', options, 'Regularize',1e-4,'covtype', cov_type, ...
            	'start', init, 'replicates', num_replicates);
	    catch
        	err_cnt = err_cnt+1;
	        flag = 0;
            while ~flag
            	try
                	model = gmdistribution.fit(data, k_idx(kk), 'options', options, 'Regularize',1e-4,'covtype', cov_type, ...
                    'start', init, 'replicates', num_replicates);
              	  flag = 1;
            	catch
                fprintf(' Ill-conditioned covariance matrix for k = %i, Trying again... \n', k_idx(kk));
                err_cnt = err_cnt+1;
            end
            
            % we gave it our best shot, so give up on this particular k
           	 if err_cnt > max_err_cnt
                	fprintf(' Maximum covariance errors exceeded, moving on...\n');
                	flag = 1;
	            end
            end
       end
    warning on
    
    % save k'th model
    if err_cnt <= max_err_cnt
        INT_MODELS{kk} = model;
        B(kk) = model.BIC;
    else
        INT_MODELS{kk} = [];
        B(kk) = nan;
    end
    ERR_CNT(kk) = err_cnt;
 end

% select model with lowest BIC score
[mval, midx] = min(B);
model = INT_MODELS{midx};

% show BIC curve
	if 0
	    figure
	    plot(k_idx,B)
	    grid on
	    xlabel('model order')
	    ylabel('BIC')
	end

models(j2).model = model;

end

