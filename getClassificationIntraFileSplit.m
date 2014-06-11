function Res = getClassificationIntraFileSplit(postVal1, postVal2)
[l m n ] = size(postVal1);
for i1 = 1 : l
	for i = 1 : m
        R(i1,i) = 0;
		for j = 1 : n
	    	   [m2 n2] = size(postVal1(i1,i,j).val1); 
  	           for k1 = 1 : n2
		           [m1 n1] = size(postVal1(i1,i,j).val1(k1).val);
			   [a b] = max([-postVal1(i1,i,j).val1(k1).val ; -postVal2(i1,i,j).val1(k1).val]);
		           Res(i1,i,j).val1(k1).val = b -1;
	           end
		end
	end
end
