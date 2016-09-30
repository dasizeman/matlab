function iterates=newton(f, fp,p0,N,TOL)
i = 1;
while i <= N
    p = p0 - f(p0)/fp(p0);
    if abs(p-p0) < TOL
        disp(['Found root ' num2str(p) ' after ' num2str(i) ' iterations.']);
        return
    end
    i = i+1;
    iterates(i) = p;
    p0 = p;
end

disp(['The method failed after ' num2str(i) ' iterations.']);
    
    