function lhsmat = build_lhs(xs,ys)

np = length(xs) - 1;
psip = zeros(np,np+1);

for i = 1:np
    for j = 1:np+1
        if j == 1 
            [a,b] = panelinf(xs(j),ys(j),xs(j+1),ys(j+1),xs(i),ys(i));
            psip(i,j) = a;
        end
        if j == np+1
            [a,b] = panelinf(xs(j-1),ys(j-1),xs(j),ys(j),xs(i),ys(i));
            psip(i,j) = b;
        end
        if j>1 && j<np+1
            [a,b] = panelinf(xs(j),ys(j),xs(j+1),ys(j+1),xs(i),ys(i));
            [a2,b2] = panelinf(xs(j-1),ys(j-1),xs(j),ys(j),xs(i),ys(i));
            psip(i,j) = a+b2;
        end
    end
end

lhsmat = zeros(np+1,np+1);
lhsmat(1,1) =1;
lhsmat(np+1,np+1) = 1;

for i = 1:np-1
    for j = 1:np+1
            lhsmat(i+1,j) = psip(i+1,j) - psip(i,j);
        end
    end
end