%alpha_list='/shared/persisted/alpha_list/alpha_rho_list2.mat';
folder = '/shared/persisted/test'

d=dir(fullfile(folder,'*.raw'));
[m n]= size(d)
dest_folder = '/shared/persisted/test';
parfor j = 1:d
extractFeaturesFileName(filename,dest_folder)
end

% alpha_list='/shared/persisted/alpha_list/alpha_rho_list2.mat';
% conf_matrix='/shared/persisted/conf_matrix/normal_weighting/';
% mkdir(conf_matrix);
% htk='/shared/tmp/htk/normal_weighting/';
% 
% parfor expnum = 1:616
% gmm_adapt_spread(alpha_list,conf_matrix,htk,expnum); 
% end
