addpath('..')

% Suppress warnings
warning('off', 'all');

% Problem 1
disp('Problem 1:');
disp('----------');

% My Lagrange function uses polyfit to compute each Lagrange interpolate,
% by specifying that the interpolate must be 1 at Xi and 0 elsewhere.
% I then multiply each L_xi by f(xi), and sum the coefficents of each power
% of x to get the final Lagrange polynomial coefficients.  I then use 
% polyval to evaluate it at each input value for plotting.

disp('Linear nodes:')
%lagrange_tests(@linear_nodes, [-5 5 -1 2.5]);

% I would expect that as n increases, the error would decrease, because we 
% are giving more information on the function, but actually the error seems
% to be increasing, due to an increased amount of fluctuations as the
% polynomial degree increases

% Problem 2
disp('Problem 2:');
disp('----------');

disp('Chebyshev nodes:')
%lagrange_tests(@chebyshev_nodes, [-5 5 0 1]);

% With the Chebyshev nodes, the error does decrease as n increases

% Problem 3
disp('Problem 3:');
disp('----------');

spline_tests();

% These fit the function much closer as n increases than the Lagrange
% interpolates


function spline_tests()
f = @(x) 1/(1+x^2);

% Define the input values
xx = -5:0.01:5;

% Plot f
y = arrayfun(f,xx);
plot(xx,y, 'r--')

hold on
for i = 5:5:20
    % Define the evenly spaced breakpoints for the spline
    x = linspace(-5,5,i);
    
    % Compute the values of the function at the breakpoints
    Y = arrayfun(f, x);
    
    % Compute and evaluate the interpolant
    yy = spline(x,Y,xx);
    
    % Plot the results
    plot(xx,yy)
end
hold off
end

function lagrange_tests(nodefunc, axis_bounds)
f = @(x) 1/(1+x^2);
q = 1+sqrt(10);

for i = 5:5:20
    nodes = nodefunc(-5,5,i+1);
    lagrange_poly = lagrange(f,nodes);

    x = -5:0.01:5;
    y = polyval(lagrange_poly,x);
    yreal = arrayfun(f,x);
    figure(i);
    hold on
    axis(axis_bounds); 
    plot(x,y)
    plot(x,yreal)
    hold off
    q_error = abs(f(q) - polyval(lagrange_poly, q));
    disp(['q_error for n= ' num2str(i) ': ' num2str(q_error)]);
end
end

function nodes=linear_nodes(a,b,n)
nodes = linspace(a,b,n);
end

function nodes=chebyshev_nodes(a,b,n)
nodes=zeros(1,n);
for j=1:n
    nodes(1,j) = 5 * cos((2*j+1)/(2*n+2)*pi);
end
end

