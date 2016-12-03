addpath('..')
format long

% Problem 1
% --------------------

% 5th degree Legendre polynomial
p5 = @(x) x^5 - (10/9)*x^3 + (5/21)*x;

% Its derivative 
p5p = @(x) 5*x^4 - (30/9)*x^2 + (5/21);


% Search for roots in [-1,1]
foundRoots = [];
for x = -1:0.1:1
    root = newton(p5, p5p, x, 100, 10^(-7));
    if isempty(root) == false
        % See if we already found this root
      newRoot = true;
      for r = foundRoots
          if abs(root-r) < 10^(-7)
            newRoot = false;
          end
      end
      if newRoot
          foundRoots = [foundRoots root];
      end
    end
end

% Weights obtained from the book
p5weights = [0.2369268850 0.4786286705 0.5688888889 0.2369268850 0.4786286705];

% This is our function mapped to [-1,1]
f = @(t) (cos((pi/8)*(t+1)))^2;

% Multiply by (b-a)/2
disp('Problem 1:')
gaussian(f, foundRoots, p5weights) * (pi/8)

% We get 0.642699081678867, and the true value is (2+pi)/8,
% or about 0.642699081698724.  We can see it is close, within
% 10^-10

% Problem 2
ft = @(t) (1/sqrt(2*pi))*exp(-t^2/2);

% Experimenting to find a high enough n for 10^-8 accuracy
%comp_simpson(ft, 0,1,100)

% n = 100 seems good enough

% Define our function to find the root of
f = @(x) comp_simpson(ft, 0, x, 100) - 0.45;

% This is its derivative
fp = @(x) (1/sqrt(2*pi))*exp(-x^2/2);

disp('Problem 2 - Simpson:')

% Find the root with newton's method and p0 = 0.5
newton(f, fp, 0.5, 100, 10^(-5))

% And we get 1.644853626754611

% Now using Composite Trapezoid rule
% Test the accuracy

%comp_trap(ft,0,1,2000)

% Redefine the root function to use the new rule
f = @(x) comp_trap(ft, 0, x, 100) - 0.45;

disp('Problem 2 - Trapezoidal')

% Find the root with newton's method and p0 = 0.5
newton(f, fp, 0.5, 100, 10^(-5))

% And we get  1.644890713569369

% The answer differs because of the difference in accuracy between
% the integration rules


