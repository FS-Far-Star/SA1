function lhsmat = build_lhs(xs,ys)
<<<<<<< HEAD
np = length(xs) - 1;
psip = zeros(np,np+1);

for i = 0:np
    for j = 0:np+1
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
            psip(i,j) = a+b;
        end
    end
end

lhsmat = zeros(np+1,np+1);

for i = 0:np
    for j = 0:np+1
        lhsmat(i+1,j) = psip(i+1,j) - psip(i,j);
    end
end
=======

np = length(xs) - 1;
psip = zeros(np,np+1);
lhsmat = zeros(np+1,np+1);





end

>>>>>>> dc06ad18c3ee0e77966260c0c8a4a17de2967aab
