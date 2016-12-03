function root=newton(f, fp,p0,N,TOL)
i = 1;
while i <= N
    p = p0 - f(p0)/fp(p0);
     i = i+1;
    if abs(p-p0) < TOL
        disp(['Found root ' num2str(p) ' after ' num2str(i) ' iterations.']);
        root(1) = p;
        return
    end
  
    p0 = p;
end

disp(['The method failed after ' num2str(i-1) ' iterations.']);
    
    