clear
close all

np = 100;
nx = 51;
ny = 41;
xmin = -2.5;
xmax = 2.5;
ymin = -2;
ymax = 2;

theta = (0:np)*2*pi/np;
xs = zeros(np+1);
ys = zeros(np+1);

for i = 1:np+1
    xs(i) = cos(theta(i));
    ys(i) = sin(theta(i));
end

xm = zeros(nx, ny);
ym = zeros(nx, ny);
% psi = zeros(nx, ny);

for i=1:nx
    for j=1:ny
        xm(i,j) = xmin + (i-1)*(xmax-xmin)/(nx-1);
        ym(i,j) = ymin + (j-1)*(ymax-ymin)/(ny-1);
    end
end

psi = ym;

for i=1:nx
    for j=1:ny
        for k = 1:np
            xa = xs(k);
            xb = xs(k+1);
            ya = ys(k);
            yb = ys(k+1);
            gamma_a = -2*sin(theta(k));
            gamma_b = -2*sin(theta(k+1));
            [infa,infb] = panelinf(xa,ya,xb,yb,xm(i,j),ym(i,j));
            psi(i,j) = psi(i,j) + infa*gamma_a + infb*gamma_b;
        end
    end
end

c = -1.75:0.25:1.75;

figure;
contour(xm,ym,psi,c);
title('cylinder flow')