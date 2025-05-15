clear
close all

nx = 51;
ny = 41;
xmin = -5;
xmax = 5;
ymin = -5;
ymax = 5;
xc = 0;
yc = 0;
Gamma = 1;


for i=1:nx
    for j=1:ny
        xm(i,j) = xmin + (i-1)*(xmax-xmin)/(nx-1);
    end
end

for i=1:nx
    for j=1:ny
        ym(i,j) = ymin + (j-1)*(ymax-ymin)/(ny-1);
    end
end

for i=1:nx
    for j=1:ny
        psi(i,j) = psipv(xc,yc,Gamma,xm(i,j),ym(i,j));
    end
end

c = -0.4:0.2:1.2;
contour(xm,ym,psi,c)