function R  = getDist(noise2, clean2, GT, m)
clean1 = exp(-clean2);
noise1 = exp(-noise2);
lrt = log(clean1./noise1);
for j = 1 : 6; 
    if m > 0
        for j1 = 1 : 50;
            R2 = [ zeros(1,m) squeeze(lrt(j,j1,:))' zeros(1,m)];
            R2 = sum(buffer(R2, 2*m+1,2*m, 'nodelay'));
            R1(1,j1,:) = R2';
        end
    
    else 
           R1 = lrt(j,:,:);
    end
    R(j).cleanLRT = R1(GT(j,:,1:237) == 1);
    [cy cx] = hist(R(j).cleanLRT,20);
    R(j).cx = cx;
    R(j).cy = cy;
    R(j).wrongLRT = R1(GT(j,:,1:237) == 0);
    [wy wx] = hist(R(j).wrongLRT,20);
    R(j).wx = wx;
    R(j).wy = wy;
    
end

