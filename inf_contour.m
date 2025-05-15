clear
close all

nx = 51;
ny = 41;
xmin = -2.5;
xmax = 2.5;
ymin = -2;
ymax = 2;

del = 1.5;
Gamma = 3.0; 
xm = zeros(nx, ny);
ym = zeros(nx, ny);
a = zeros(nx, ny);
b = zeros(nx, ny);
psi = zeros(nx, ny);

nv = 100;

for i=1:nx
    for j=1:ny
        xm(i,j) = xmin + (i-1)*(xmax-xmin)/(nx-1);
        ym(i,j) = ymin + (j-1)*(ymax-ymin)/(ny-1);
        [a(i,j),b(i,j)] = refpaninf(del,xm(i,j),ym(i,j));
        psi(i,j) = 0;
        for n = i:nv+1
            xc = n*del/nv;
            yc = 0; 
            psi(i,j) = psi(i,j) + psipv(xc,yc,Gamma,xm(i,j),ym(i,j));
        end
    end
end

c = -0.15:0.05:0.15;
figure;
contour(xm,ym,a,c);
title("influence coefficient a - exact");

figure;
contour(xm,ym,b,c);
title("influence coefficient b - exact");

figure;
contour(xm,ym,psi,c);