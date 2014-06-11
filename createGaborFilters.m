function G = createGaborFilters(rv, sv, paras)
rvLength = length(rv);
svLength = length(sv);

for scaleInd = 1 : svLength
    for rateInd = 1 : rvLength
        G(rateInd, scaleInd).filt = gaborFilter(rv(rateInd), sv(scaleInd),paras, theta);   
    end
end

function G = gaborFilter(rateVal, scaleVal, paras)
theta = 0;
tConst = 1000/paras(1);
fConst = 128/5.3;
sigT = (tConst/(2*abs(rateVal)));
sigF = (fConst/(2*scaleVal));
rateFreq =abs(rateVal)/tConst;
scaleFreq = scaleVal/fConst;
Sx1=1.25*sigT;
Sy1=1.25*sigF;
rateSign = sign(rateVal);
for t = -rateSign*fix(Sx1):rateSign:rateSign*fix(Sx1)
    for f = -1*fix(Sy1):1*fix(Sy1)
        t1=t*cos(theta)+f*sin(theta);
        f1=-t*sin(theta)+f*cos(theta);
        G(1*fix(Sx1)+t+1,1*fix(Sy1)+f+1) = (1/(2*pi*sigT*sigF))* ...
            exp(-.5*((t1/sigT)^2+(f1/sigF)^2)+2*pi*1i*(rateFreq*t1+scaleFreq*f1));
   end
end
