function R =projectFeatures(folder, ext, tsvd_map, dim, extout,extout1, weights, weights2)
[m1 n1] = size(folder);
for j1 = 1 : n1
        files = dir(fullfile(folder(j1).name, ext));
        [m n] = size(files);
        for j = 1 : m
            files(j).name
            load([folder(j1).name '/' files(j).name], '-mat');
            [m2 n2] = size(gabFeat);
            outFile = [folder(j1).name '/' files(j).name extout(j1).name extout1];
            for j2 = 1 : n2
                obj.cr1 = gabFeat(j2).cr.x(:,:,1,:);
                cr1 = squeeze(obj.cr1);
		cr1=obj.cr1;
                cr1=squeeze(obj.cr1);
		w = weights(j1).weight.*weights2.weight
%                cr1 = (squeeze(cr1).*weights(j1).weight);
		cr1 = cr1.*w - tsvd_map.mean;
                cr1 = tmuln(cr1,tsvd_map.U{1}(:,:)',1);
                cr1 = tmuln(cr1,tsvd_map.U{2}(:,:)',2);
                cr1 = tmuln(cr1,tsvd_map.U{3}(:,:)',3);
                cr1=cr1(1:dim(1),1:dim(2), 1:dim(3));
                feat=cr1(:);
                features(j2,:) = feat';
            end 
           save(outFile, 'features');
           clear gabFeat
        end
end     
R=1;    

