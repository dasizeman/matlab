addpath('..')

% Problem 1
%-----------
disp('Problem 1');
disp('-----------------------------------');

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

% The difference between the theoretical and observed number of iterations
% is probably due to compounding floating point error when calculating the
% interval size.

% Calculate absolute error at each iterate
absError = arrayfun(@(x) abs(pActual-x), iterates);
disp('Absolute error for each iterate:');
disp(absError);

% I am interpreting "significant digits of accuracy" as how small the
% absolute error is (number of digits after decimal point).  In general, we
% see that accuracy increases, but it is not continuously increasing, that
% is a less accurate iterate may come after a more accurate one.

%plot(1:10, absError(1:10));

% Part (c)
disp('Newton''s Method:');
fp = @(x) 3*x^2;
iterates = newton(f,fp,3,100,10^-20);
% Found root 2.924 after 5 iterations.

% Part (d)
% Calculate absolute error at each iterate
absError = arrayfun(@(x) abs(pActual-x), iterates);
disp('Absolute error for each iterate:');
disp(absError);

% The convergence for Newton's method is much faster than the bisection
% method, and we can see the absolute error decreasing and absolute digits
% of accuracy increasing at a much faster rate than bisection.  It looks to
% be at least quadratic in speed of convergence.


%------------------------------------------------------------------


% Problem 2
%-----------

disp('Problem 2');
disp('-----------------------------------');

ga = @(x) x*(1+(7-x^5)/(x^2))^3;

gb = @(x) x - (x^5-7)/(x^2);

gc = @(x) x - (x^5-7)/(5*x^4);

gd = @(x) x - (x^5-7) / 12;

functions = {ga, gb, gc, gd};

pActual = nthroot(7,5);


for i = 1:4
    % Run fixed point iteration on this g(x)
    iterates = fixedpt(functions{i}, 1, 500, 10^-5);
    
    % Calculate absolute error at each iterate
    %absError = arrayfun(@(x) abs(pActual-x), iterates);
    %disp(absError);
end

% Test g around p0 = 1 to see if g(x) is in the interval
%for i = 1:0.1:2.5
 %   gb(i)
%end

% Convergence ranking (greatest to least)
% (c), (d), (a and b)

% For (a), the g(x) function decreases very quickly, so it seems like
% there is no interval [a,b] for which g(x) is always within [a,b].  The
% fixed point iteration does not converge.

% For (b), the story is the same, although it doesn't decrease quite as
% fast.

% (c) is the g(x) from Newton's method.  g'(x) at the root of
% f(x) = x^5-7 is zero, so in the area around the root our k term from
% the fixed point theorum can be arbitrarily low, so convergence is very
% fast.

% (d) also converges, but much more slowly.  In this case, if we plug the
% root into g'(x), we get about 0.976, meaning the k value must be >= to
% this number.  This large k explains the slow convergence.

%----------------------------------------------------------------








