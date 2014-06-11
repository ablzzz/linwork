function gab_filter=create_filters(paras,rv,sv)

  for pos_neg=[1 -1]
    for sind=1:length(sv)
      for rind=1:length(rv)
	tsf=1000/paras(1);
	fsf=128/5.3;
	r=abs(rv(rind));
	s=sv(sind);
	if pos_neg <0
	    rind_temp=rind+length(rv);
	    else
	        rind_temp=rind;
		end
		vart=(tsf/(2*r));
		varf=(fsf/(2*s));
		freqt=r/tsf;
		freqf=s/fsf;
    if r>100
        factorx=1.25;
        factory=1.25;
    else
        factorx=1.25;
        factory=1.25;
    end
    G = gaborfilter(vart,varf,freqt,freqf,factorx,factory);
    if pos_neg <0
        G=flipud(G);
	end
	
	gab_filter(sind,rind_temp).G=G;
      end
    end
  end
  
function [G] = gaborfilter(Sx,Sy,U,V,factorx,factory)
  
%   factor=2;
Sx1=factorx*Sx;
Sy1=factory*Sy;
  for x = -1*fix(Sx1):1*fix(Sx1)
    for y = -1*fix(Sy1):1*fix(Sy1)
      %         x1=x*cos(theta)+y*sin(theta);
      %         y1=-x*sin(theta)+y*cos(theta);
      G(1*fix(Sx1)+x+1,1*fix(Sy1)+y+1) = (1/(2*pi*Sx*Sy))* ...
	    exp(-.5*((x/Sx)^2+(y/Sy)^2)+2*pi*1i*(U*x+V*y));
    end
  end
  
