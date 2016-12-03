function val=comp_trap(f,a,b,n)
    h = (b-a)/n;
    
    sum = 0;
    for j = 1:n-1
        xj = a + j*h;
        sum = sum + f(xj);
    end
    
    val = (h/2)*(f(a)+(2*sum)+f(b));
end