function [model, INT_MODELS, B] = fit_gmm_v2_loadData(folder, ext, use_kmeans_init, k_idx, cov_type)
addpath ~/workspace/nsltools
files = dir(fullfile(folder, ext));
[m1 n1] = size(files)
data = [];
for j1 = 1 : m1
    data1 = load([folder '/' files(j1).name]) ;
    data1 = unitseq(data1);
    data = vertcat(data, data1');
end
size(data)
if nargin < 3
    use_kmeans_init = 0;
    k_idx = 2:15;
    cov_type = 'diag';
elseif nargin < 4
    k_idx = 2:15;
    cov_type = 'diag';
elseif nargin < 5
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
%         init=randint(size(data,1),1,[1 k_idx(kk)]);
%         for zz = 1:k_idx(kk)
%             mu(zz,:) = mean(data(C==zz,:),1);
%                         Sigma = cat(3,Sigma,eye(size(data,2)));
% %             Sigma = cat(3,Sigma,cov(data(C==zz,:)));
% %             PComponents(zz) = sum(C==zz)./size(data,1);
%         end
%         init = [];
%         init.mu = mu;
%         init.Sigma = Sigma;
%         init.PComponents = (1/k_idx(kk)).*ones(1,k_idx(kk));
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
