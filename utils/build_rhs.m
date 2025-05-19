function rhsvec = build_rhs(xs,ys,alpha)
    b = zeros(length(xs));
    for n = 1:length(xs)
        b(n) = alpha_freestream(xs(n),ys(n),alpha) - alpha_freestream(xs(n+1),ys(n+1),alpha);
    end
    b(length(xs)) = alpha_freestream(xs(length(xs)),ys(length(xs)),alpha) - alpha_freestream(xs(1),ys(1),alpha);
    rhsvec = b;
end

