addpath('..')

% Problem 1
%-----------

%Part (a)
f = @(x) x^3-25;

% We will compute the theoretical number of bisection iterations on the
% interval [2,3]
% (b-a)2^-N < 10^-20
% -Nlog10(2) < -20
% N > 20/log10(2)

est = ceil(20/log10(2));
disp(['Bisection should theoretically take ' num2str(est) ' iterations']);

% Part (b)
pActual = nthroot(25,3);

% Run the bisection method and save iterates
% Found root 2.924 after 49 iterations.
iterates = bisect(f, 2,3,100,10^-20);

% Calculate absolute error at each iterate
absError = arrayfun(@(x) abs(pActual-x), iterates);
disp(absError);

% I am interpreting "significant digits of accuracy" as how small the
% absolute error is (number of digits after decimal point).  In general, we
% see that accuracy increases, but it is not continuously increasing, that
% is a less accurate iterate may come after a more accurate one.

%plot(1:10, absError(1:10));

% Part (c)
fp = @(x) 3*x^2;
iterates = newton(f,fp,3,100,10^-20);
% Found root 2.924 after 5 iterations.

% Part (d)
% Calculate absolute error at each iterate
absError = arrayfun(@(x) abs(pActual-x), iterates);
disp(absError);

% The convergence for Newton's method is much faster than the bisection
% method, and we can see the absolute error decreasing and absolute digits
% of accuracy increasing at a much faster rate than bisection.  It looks to
% be at least quadratic in speed of convergence.

% Problem 2
%-----------



