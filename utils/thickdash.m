function dthickdx = thickdash(xmx0,thick)

global Re ue0 duedx

He = thick(2)/Thick(1);

if He >= 1.46
    H = (11*He + 15)/(48*He - 59);
elseif He < 1.46
    H = 2.803;
end

ue = ue0 + duedx * xmx0;

Rethet = Re * ue * thick(1);

cf = 0.091448 * ((H-1) * Rethet)^(-0.232) * e^(-1.26*H);

cdiss = 