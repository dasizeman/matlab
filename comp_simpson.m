function val=comp_simpson(f,a,b,n)
    h = (b-a) / n;
    XI0 = f(a) + f(b);
    XI1 = 0;
    XI2 = 0;
    
    for i = 1:n-1
        X = a + i*h;
        if mod(i,2) == 0
            XI2 = XI2 + f(X);
        else
            XI1 = XI1 + f(X);
        end
    end
    
    val = h * (XI0 + 2 * XI2 + 4 * XI1)/3;
end