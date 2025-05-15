function [infa, infb] = panelinf(xa,ya,xb,yb,x,y)
t = (xb-xa)/sqrt((xb-xa)^2 + (yb-ya)^2) : (yb-ya)/sqrt((xb-xa)^2 + (yb-ya)^2);

n = (xb-xa)/sqrt((xb-xa)^2 + (1/(yb-ya))^2) : -1/(yv-ya)/sqrt((xb-xa)^2 + (1/(yb-ya))^2);

r = (x-xa) : (y-ya);

X = dot(r,t);
Y = dot(r,n);

I = refpaninf(del, X, Y);

infa = I(1);
infb = I(2);