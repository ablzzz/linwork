
 function feat=reduce_load(filename,weights,tsvd_map)

%%%%%%%%%%%reducing after weighting

% cr_size=[11 20 128];
red_dim=[3 5 8];

load(filename);
% cr(:,:,=cr1;
% cr1=cr;
% cr1=cr1.*weights;
% cr1=cr1-tsvd_map.mean; %change
cr1=(squeeze(cr1).*weights)-tsvd_map.mean;
cr1 = tmuln(cr1,tsvd_map.U{1}(:,1:red_dim(1))',1);
cr1 = tmuln(cr1,tsvd_map.U{2}(:,1:red_dim(2))',2);
cr1 = tmuln(cr1,tsvd_map.U{3}(:,1:red_dim(3))',3);
feat=cr1(:);
