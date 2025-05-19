clear
close all

nx = 51;
ny = 41;
xmin = -2.5;
xmax = 2.5;
ymin = -2;
ymax = 2;

del = 1.5;
Gamma = 1.0; 
xm = zeros(nx, ny);
ym = zeros(nx, ny);
a = zeros(nx, ny);
b = zeros(nx, ny);
psi_a = zeros(nx, ny);
psi_b = zeros(nx, ny);

nv = 100;
dx = del/nv;
gamma = 1;

for i=1:nx
    for j=1:ny
        xm(i,j) = xmin + (i-1)*(xmax-xmin)/(nx-1);
        ym(i,j) = ymin + (j-1)*(ymax-ymin)/(ny-1);
        [a(i,j),b(i,j)] = refpaninf(del,xm(i,j),ym(i,j));
        psi_a(i,j) = 0;
        psi_b(i,j) = 0;
        for n = 1:nv
            xc = n*del/(nv+1);
            yc = 0; 
            Gamma_a = dx*(gamma*(1-(n/(nv+1))));
            Gamma_b = dx*gamma*(n/(nv+1));
            psi_a(i,j) = psi_a(i,j) + psipv(xc,yc,Gamma_a,xm(i,j),ym(i,j));
            psi_b(i,j) = psi_b(i,j) + psipv(xc,yc,Gamma_b,xm(i,j),ym(i,j));
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
contour(xm,ym,psi_a,c);
title("influence coefficient a - approx");

figure;
contour(xm,ym,psi_b,c);
title("influence coefficient b - approx");