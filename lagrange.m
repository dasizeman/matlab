function coeffs=lagrange(f,a,b,n)
% Get the lagrange interpolates
xvals = linspace(a,b,n+1);
Lx = l_interps(xvals);

% Scale each interpolate by f(xi)
for i = 1:length(xvals)
    Lx(i,:) = Lx(i,:) .* f(xvals(i));
end

% Sum the columns (the coefficents of each degree of x) to get the final
% lagrange polynomial coefficients
coeffs = sum(Lx);


function interps=l_interps(xvals)
% Returns a matrix such that row i contains the coefficients of the i-1th
% lagrange interpolate (so row 1 contains L0(x), row 2 contains L1(x), etc)
n = length(xvals);
interps = zeros(n);
% Generate each of the n lagrange interpolates, and put each as a row
% in the result matrix
for i = 1:n
    polyvals = zeros(1,n);
    polyvals(i) = 1;
    interps(i,:) = polyfit(xvals, polyvals, n-1);    
end
