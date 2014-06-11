function R = wrapper_extractFeaturess(folder, dest_folder, ext, extention)
%path(path,'/shared/persisted/nsltools');
path(path, '~/workspace/nsltools');
%load('/shared/persisted/folder_list/folder.mat');
%load('/shared/persisted/folder_list/ext.mat');
%dest_folder = '/shared/tmp';
%ext = '*.raw';
%folder = '/shared/persisted/test'
[m1 n1] = size(folder)
for j1 = 1 : length(folder)
		d=dir(fullfile(folder(j1).name,ext));
	[m n]= size(d)
%dest_folder = '/shared/persisted/test';
	for j = 1: m
	    filename=[folder(j1).name '/' d(j).name]
	    extractFeaturesFileNameWav(folder(j1).name , d(j).name , dest_folder, extention(j1).name)
	end
end

% alpha_list='/shared/persisted/alpha_list/alpha_rho_list2.mat';
% conf_matrix='/shared/persisted/conf_matrix/normal_weighting/';
% mkdir(conf_matrix);
% htk='/shared/tmp/htk/normal_weighting/';
% 
% parfor expnum = 1:616
% gmm_adapt_spread(alpha_list,conf_matrix,htk,expnum); 
% end
