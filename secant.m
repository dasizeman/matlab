function iterates = secant (f,p0,p1, N, TOL)
i = 2;
q0 = f(p0);
q1 = f(p1);

while i <= N
    p = p1 - q1*(p1-p0)/(q1-q0);
    iterates(i) = p;
    i = i+1;
    
    if abs(p-p1) < TOL
        disp(['Found root ' num2str(p) ' after ' num2str(i) ' iterations.']);
        return
    end
    
    p0=p1;
    q0=q1;
    p1=p;
    q1=f(p);
end

disp(['The method failed after ' num2str(i-1) ' iterations.']);


