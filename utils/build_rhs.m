function rhsvec = build_rhs(xs,ys,alpha)
    b = zeros(length(xs),1);
    for n = 1:length(xs)-1
        b(n+1,1) = alpha_freestream(xs(n),ys(n),alpha) - alpha_freestream(xs(n+1),ys(n+1),alpha);
    end
    b(1,1) = 0;
    b(length(xs),1) = 0; % BC of gamma 0 and -1 = 0 
    rhsvec = b;
end

