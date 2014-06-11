function R = getClassificationSpread(postVal1, postVal2)
x = length(size(postVal1));
if x == 3
	[l m n] = size(postVal1);
	for i = 1 : l
		for j = 1 : m 
		Res(i,j).val = [];
			for k = 1 : n
				[a b] = max([-postVal1(i,j,k).val; -postVal2(i,j,k).val]);
				val(b == 2) = 0;
				val(b == 1) = 1;
				Res(i,j).val = [Res(i,j).val val];
				clear val
			end
		end
	end
	R = Res;
else
	[m n] = size(postVal1);
	for j = 1 : m
                Res(j).val = [];
                for k = 1 : n
                         [a b] = max([-postVal1(j,k).val; -postVal2(j,k).val]);
                         val(b == 2) = 0;
                         val(b == 1) = 1;
                         Res(j).val = [Res(j).val val];
                         clear val
                end     
         end
	 R = Res;
end
