function [R Spread Result] = getClassification(postVal1, postVal2)
[l m n ] = size(postVal1);
for i1 = 1 : l
  for i = 1 : m
       R(i1,i) = 0;
       Result(i1,i).val = [];
	for j = 1 : n
	    [m2 n2] = size(postVal1(i1,i,j).val1); 
	    for k1 = 1 : n2
		[m1 n1] = size(postVal1(i1,i,j).val1(k1).val);
%		for k = 1 : n1
		[a b] = max([-sum(postVal1(i1,i,j).val1(k1).val) ; -sum(postVal2(i1,i,j).val1(k1).val)]);
		Res = b - 1;
		%	end
		Spread(i1,i).val1((j-1)*60+k1).val = b -1; 		
		Result(i1,i).val = [Result(i1,i).val Res];
		R(i1,i) = R(i1,i) + Res;
	    end
	end
  end
end
