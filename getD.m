function R1 = getD(noise,clean, GT, arr)
k=1;
for eta = arr; 
    
    R = getClassificationLRT(noise,clean, GT, eta);
    R1.S_S(k,:) = R.S_S;
    R1.N_S(k,:) = R.N_S;
    R1.N_N(k,:) = R.N_N;
    R1.S_N(k,:) = R.S_N;
    k = k +1;
end