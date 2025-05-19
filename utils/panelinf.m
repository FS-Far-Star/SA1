function [infa, infb] = panelinf(xa,ya,xb,yb,x,y)
t = zeros(1,2);
n = zeros(1,2);
t(1,1) = (xb-xa)/sqrt((xb-xa)^2 + (yb-ya)^2);
t(1,2) = (yb-ya)/sqrt((xb-xa)^2 + (yb-ya)^2);

n(1,2) = (xb-xa)/sqrt((xb-xa)^2 + (yb-ya)^2); 
n(1,1) = (-(yb-ya)) /sqrt((xb-xa)^2 + (yb-ya)^2);

r = zeros(1,2);
r(1,1) = (x-xa); 
r(1,2) = (y-ya);

X = dot(r,t);
Y = dot(r,n);
del = sqrt((xb-xa)^2 + (yb-ya)^2);

[infa,infb] = refpaninf(del, X, Y);