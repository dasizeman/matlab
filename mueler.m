function iterates=mueler(f, p0, p1, p2, N, TOL)

i = 3;
while i <= N
    h1=p1-p0;
    h2=p2-p1;
    delta_1 = (f(p1)-f(p0))/h1;
    delta_2 = (f(p2)-f(p1))/h2;
    d = (delta_2-delta_1)/(h2+h1);
    
    b = delta_2 + h2*d;
    D = sqrt(b^2-4*f(p2)*d); % may produce a complex number
    
    if abs(b-D) < abs(b+D)
        E = b+D;
    else
        E = b-D;
    end
    
    h = -2*f(p2)/E;
    p = p2 + h;
    
    iterates(i) = p;
    i = i + 1;
    
    if abs(h) < TOL
        disp(['Found root ' num2str(p) ' after ' num2str(i) ' iterations.']);
        return
    end
    
    p0=p1;
    p1=p2;
    p2=p;
end

disp(['The method failed after ' num2str(i-1) ' iterations.']);