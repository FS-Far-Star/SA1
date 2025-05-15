clear
close all

nx = 51;
ny = 41;
xmin = -2.5;
xmax = 2.5;
ymin = -2;
ymax = 2;

del = 1.5;
xm = zeros(nx, ny);
ym = zeros(nx, ny);
a = zeros(nx, ny);
b = zeros(nx, ny);

for i=1:nx
    for j=1:ny
        xm(i,j) = xmin + (i-1)*(xmax-xmin)/(nx-1);
        ym(i,j) = ymin + (j-1)*(ymax-ymin)/(ny-1);
        [a(i,j),b(i,j)] = refpaninf(del,xm(i,j),ym(i,j));
    end
end

c = -0.15:0.05:0.15;
contour(xm,ym,a,c);
figure;
contour(xm,ym,b,c);