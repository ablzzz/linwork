function R = svmCompileResults(folder, ext, model, GT, k, mask)
f = dir(fullfile(folder, ext));
[m n] = size(f);
dat = []; grt = []; predicted_label = [];
for j = 1 : m; a = load([folder '/' f(j).name], '-mat'); 
	for ji = 1 : 237;
		dat = [dat ; mask.*(a.gabFeat(ji).cr.x(:)')]; 
	end
	j
	[predicted_label1, accuracy, decision_values] = svmpredict( ones(237,1) , dat , model);
	predicted_label = [predicted_label; predicted_label1];
	size(predicted_label)
	dat = [];
end
size(GT)
for j = 1 : m; 
	j
	a =  squeeze(GT(k,j,1:237))  ; 
	grt = [grt ; a];  
end
grt(grt == 0) = -1;
%[predicted_label1, accuracy, decision_values] = svmpredict( grt , dat , model);

%%%% TP and FP %%%%%%
p1 = predicted_label; 
p2 = p1; p1(p1 == -1) = 0; p2(p2 == 1) = 0;
p3 = p1.*grt; p4 = p2.*grt;
TP = (sum(p3 == 1))/(sum(grt == 1));
FP = (sum(p3 == -1))/(sum(grt == -1));
TN = (sum(p4 == 1))/(sum(grt == -1));
FN = (sum(p4 == -1))/(sum(grt == 1));
R.TP = TP*100; R.FP = FP*100; R.TN = TN*100;
R.FN = FN*100;
R.accuracy = accuracy(1);
%R.grt = grt;
%R.dat = dat;
