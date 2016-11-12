addpath('..')

% Suppress warnings
warning('off', 'all');

f = @(x) 1/(1+x^2);

% My Lagrange function uses polyfit to compute each Lagrange interpolate,
% by specifying that the interpolate must be 1 at Xi and 0 elsewhere.
% I then multiply each L_xi by f(xi), and sum the coefficents of each power
% of x to get the final Lagrange polynomial coefficients.  I then use 
% polyval to evaluate it at each input value for plotting.

q = 1+sqrt(10);
for i = 5:5:20
    lagrange_poly = lagrange(f,-5,5,i);

    x = -5:0.01:5;
    y = polyval(lagrange_poly,x);
    yreal = arrayfun(f,x);
    figure(i);
    hold on
    axis([-5 5 -1 2.5]); 
    plot(x,y)
    plot(x,yreal)
    hold off
    q_error = abs(f(q) - polyval(lagrange_poly, q));
    disp(['q_error for n= ' num2str(i) ': ' num2str(q_error)]);
end

% I would expect that as n increases, the error would decrease, because we 
% are giving more information on the function, but actually the error seems
% to be increasing, due to an increased amount of fluctuations as the
% polynomial degree increases