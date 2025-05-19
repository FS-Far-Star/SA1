clear
close all

np = 100;
nx = 51;
ny = 41;
% xmin = -2.5;
% xmax = 2.5;
% ymin = -2;
% ymax = 2;
alpha = 0.1;

theta = (0:np)*2*pi/np;
xs = zeros(np+1);
ys = zeros(np+1);

for i = 1:np+1
    xs(i) = cos(theta(i));
    ys(i) = sin(theta(i));
end

A = build_lhs(xs,ys);
b = build_rhs(xs,ys,alpha);
gam = A\b;
sum(gam)

plot(theta/pi,gam)

% axis([0 2 -2.5 2.5]);
