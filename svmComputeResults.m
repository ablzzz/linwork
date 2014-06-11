function R = svmCompileResults(folder, ext, model, GT, k)
f = dir(fullfile(folder, ext));
[m n] = size(f)
dat = []; grt = [];
for j = 1 : m; a = load([folder '/' f(j).name], '-mat'); dat = [dat ; a.features]; end
[m1 n1] = size(a.features)
size(GT)
for j = 1 : m; 
	j
	a =  squeeze(GT(k,j,1:237))  ; 
	grt = [grt ; a];  
end
grt(grt == 0) = -1;
[predicted_label, accuracy, decision_values] = svmpredict( grt , dat , model);

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
