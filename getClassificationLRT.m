function Res  = getClassificationQUT(noise, clean , GT, eta)

for j = 1 : 6; 
	corr = sum(sum(GT(j,:,1:237)));
	wrong = sum(sum(GT(j,:, 1:237) == 0));
	R1 = log(exp(-clean(j,:,:))./exp(-noise(j,:,:)));
	R = zeros(size(clean(j,:,:)));
	R(R1 >= eta) = 1;
	R(R1 < eta) = 0;
%	max(max(R1))
%	min(min(R1))
	%%%% Correct %%%
	Res.acc(j) = sum(sum(R == GT(j,:,1:237)))*100/(50*237);  
	temp  = R.*GT(j,:,1:237);
	Res.S_S(j) = sum(sum(temp));
	Res.N_S(j) = (sum(sum(R)) - Res.S_S(j));
	temp1 = abs(R -1);
	temp2 = abs(GT(j,:,1:237) -1);
	temp3 = squeeze(temp1).*squeeze(temp2);
	Res.N_N(j) = sum(sum(temp3));
	Res.S_N(j) = (sum(sum(temp1)) - Res.N_N(j));
	Res.S_S(j) = Res.S_S(j)*100/corr;
	Res.S_N(j) = Res.S_N(j)*100/corr;
	Res.N_S(j) = Res.N_S(j)*100/wrong;	
	Res.N_N(j) = Res.N_N(j)*100/wrong;	
	
	clear temp*
	
end 
