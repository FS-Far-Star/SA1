function [infa, infb] = panelinf(xa,ya,xb,yb,x,y)
del = sqrt((xb-xa)^2 + (yb-ya)^2);

t = zeros(1,2);
n = zeros(1,2);
t(1,1) = (xb-xa)/del;
t(1,2) = (yb-ya)/del;

n(1,2) = (xb-xa)/del; 
n(1,1) = (-(yb-ya)) /del;

r = zeros(1,2);
r(1,1) = (x-xa); 
r(1,2) = (y-ya);

X = dot(r,t);
Y = dot(r,n);

[infa,infb] = refpaninf(del, X, Y);