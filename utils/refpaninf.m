function [infa,infb] = refpaninf(del,X,Yin)
    if abs(Yin) < 1e-5
        Y = 1e-5;
    else
    Y = Yin;
    end
    I0 = -1/(4*pi) * (X*log(X^2+Y^2) - (X-del)*log((X-del)^2 + Y^2) -2*del +2*Y*(atan(X/Y)-atan((X-del)/Y)));

    I1 = 1/(8*pi) * ((X^2+Y^2)*log(X^2+Y^2)-((X-del)^2+Y^2)*log(((X-del)^2+Y^2)) - 2*X*del + del^2);
    
    infa = (1-X/del)*I0 - I1/del;
    
    infb = X/del*I0 + I1/del;
end