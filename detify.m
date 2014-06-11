function R = detify(clean, noise, GT, stringName)
col = ['r'; 'y' ; 'c' ; 'g' ;'b'; 'm'; 'k']
k=1;
arr = [6 5 1 2 3 4]
    for m = 0 :2: 10;
        Set_DET_limits(.2, .65, .2, .65);
        R= getDist(noise, clean, GT, m);
        p = 1;
        for j = arr
            
            [Pmiss, Pfa] = Compute_DET(R(j).cleanLRT, R(j).wrongLRT);
             ind = find(abs(Pmiss - Pfa) < 0.01);
             100*Pfa(ind(1))
             subplot(2,3,p)
             h(p) = Plot_Det1(Pmiss, Pfa, col(k,:));
             hold on
                     
             p = p + 1;
             
             
        end
        
         k = k+1;
    end
    subplot(236)
    legend('m = 0', '2' , '4' , '6', '8', '10')    
    
    saveas(gcf, stringName, 'fig')
    saveas(gcf, stringName, 'eps2c')
    close all