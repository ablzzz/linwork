function R =projectFeatures(folder, ext, tsvd_map, dim, extout)
[m1 n1] =size(folder)
for j1 = 1 : n1
files = dir(fullfile(folder(j1).name, ext));
[m n] = size(files);
for j = 1 : m
%    [folder '/' files(j).name]
    obj=load([folder(j1).name '/' files(j).name], '-mat'); 
   [q1 w1 e1 r1] = size(obj.crtemp1);
    obj.cr1 = obj.crtemp1(:,:,e1,:);
    cr1 = squeeze(obj.cr1);
    [o p q] =size(cr1);
    if o > 0
        outFile = [folder(j1).name '/' files(j).name extout(j1).name];
        cr1=obj.cr1;
        cr1=squeeze(obj.cr1);
	size(cr1)
        cr1= cr1(:,:,:) -tsvd_map.mean;
        cr1 = tmuln(cr1,tsvd_map.U{1}(:,:)',1);
        cr1 = tmuln(cr1,tsvd_map.U{2}(:,:)',2);
        cr1 = tmuln(cr1,tsvd_map.U{3}(:,:)',3);
        cr1=cr1(1:dim(1),1:dim(2), 1:dim(3));
        feat=cr1(:);
        dlmwrite(outFile,feat);
    end

end
end
R=1;
