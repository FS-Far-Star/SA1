function [infa infb] = refpaninf(Delta,X,Yin)
    if abs(Yin) < 1e-5
        Y = 1e-5;
    else
    Y = Yin;
    end
    I0 = -1/(4*pi) * (X*log(X^2+Y^2) - (X-Delta)*log((X-Delta)^2 + Y^2) -2*Delta +2*Y(atan(X/Y)-atan((X-Delta)/Y)));

    I1 = 1/(8*pi) * ((X^2+Y^2)*log(X^2+Y^2)-((X-Delta)^2+Y^2)*log(((X-Delta)^2+Y^2)) - 2*X*Delta + Delta^2);
    
    infa = (1-X/Delta)*I0 - I1/Delta;
    
    infb = X/Delta*I0 + I1/Delta;
end