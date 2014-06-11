function distMat = computeDistance(folder , ext, template, dim)
files = dir(fullfile(folder, ext));
[m n] = size(files);
if dim == 3
   template = mean(template,3);
else if dim == 2
	template = squeeze(mean(template,2));
     else if dim == 1
	     template = squeeze(mean(template,1));
          end 
     end
end

temp =  template(:);
templateMag = sqrt(sum(temp.*temp));
for j = 1 : m
	files1 = dir(fullfile(folder, [files(j).name(1 : length(files(j).name) - 4) '*mat']));
	for i = 1 : length(files1)
		tempObj = load([folder '/' files1(i).name]);
		obj = squeeze(tempObj.crtemp1);
		if dim == 3
   			obj = mean(obj,3);
		else if dim == 2
		        obj = squeeze(mean(obj,2));
		     else if dim == 1
		             obj = squeeze(mean(obj,1));
		          end
		     end
		end

		size(obj)
		objDiff = template - obj;
		objDiff = objDiff(:);
		objDist = sqrt(sum(objDiff.*objDiff));
		dist = 1  - objDist/templateMag;
%		distMat(j).val(i) = dist;
		distMat(j) = dist;
	end
end
