function [model, INT_MODELS, B] = fit_gmm_v2(data, use_kmeans_init, k_idx, cov_type)

if nargin < 2
    use_kmeans_init = 0;
    k_idx = 2:15;
    cov_type = 'diag';
elseif nargin < 3
    k_idx = 2:15;
    cov_type = 'diag';
elseif nargin < 4
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
