function iterates=fixedpt(g,p0,N,TOL)
i = 1;
while i <= N
    p = g(p0);
    delta = abs(p-p0);
    if delta < TOL
        disp(['Found fixed point ' num2str(p) ' after ' num2str(i) ' iterations.']);
        return
    end
    i = i + 1;
    iterates(i) = p;
    p0 = p;
end

disp(['The method failed after ' num2str(i-1) ' iterations.']);