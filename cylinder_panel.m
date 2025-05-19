clear
close all

np = 100;
nx = 51;
ny = 41;
alpha = 0;

theta = (0:np)*2*pi/np;
xs = zeros(np+1);
ys = zeros(np+1);

for i = 1:np+1
    xs(i) = cos(theta(i));
    ys(i) = sin(theta(i));
end

A = build_lhs(xs,ys);
b0 = build_rhs(xs,ys,0);
b1 = build_rhs(xs,ys,0.1);
gam0 = A\b0;
gam1 = A\b1;
total_circulation0 = sum(gam0)*(2*pi/np);
total_circulation1 = sum(gam1)*(2*pi/np);
disp(total_circulation0);
disp(total_circulation1);

figure;
plot(theta/pi,gam0)
title("alpha = 0");
axis([0 2 -2.5 2.5]);

figure;
plot(theta/pi,gam1)
title("alpha = 0.1");
axis([0 2 -2.5 2.5]);