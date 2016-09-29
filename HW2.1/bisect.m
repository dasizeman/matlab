function bisect(f, a, b, N, TOL)
i = 1;
FA = f(a);


while i <= N
    p = a + (b-a)/2;
    disp((b-a)/2)
    FP = f(p);
    disp(FP)
    if FP == 0 || (b-a)/2 < TOL % found the root or close enough
        break
    elseif sign(FA) * sign(FP) > 0 % root in other half
        a = p;
        FA = FP;
    else % Root is in this half
        b = p;
    end
    i = i + 1;
end

outputStr = ['Found root ' num2str(p) ' after ' num2str(i) ' iterations.'];
disp(outputStr)

    
     
        
    
    
