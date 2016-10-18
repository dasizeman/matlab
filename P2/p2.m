addpath('..')

% Problem 1
f = @(x) x^5 - x^4 + 2*x^3 - 3*x^2 + x - 4;
fp = @(x) 5*x^4 - 4*x^3 + 6*x^2 - 6*x + 1;

disp('Problem 1');
disp('----------');
disp('Finding roots of f(x)=x^5-x^4+2*x^3 - 3*x^2 + x - 4');
%(a)
% f(1) = -4, and f(2) = 18, so 1 < p < 2 by IVT
disp('Part (a): Newton''s Method');
disp('Using p0 = 1.5');
newton(f, fp, 1.5, 100, 10^(-6));
disp('~~~~~~~~~~');


%(b)
% Use two initial guesses close to each other for secant method
disp('Part (b): Secant Method');
disp('Using p0 = 1.5, p1 = 1.501');
secant(f,1.5,1.501, 100, 10^(-6));
disp('~~~~~~~~~~');

%(c)
disp('Part (c): Mueler''s Method');
disp('Using values close to Secant values to find the real root');

% Similar values to the other methods should be fine for the real root
mueler(f, 1.4, 1.5, 1.501, 100, 10^(-6));
% I really just guessed different values on intervals less than the real
% root to find the complex roots
disp('Using p0 = -5, p1 = -4.5, p2 = -4 to find first complex root');
mueler(f, -5, -4.5, -4, 100, 10^(-6));
disp('Using p0 = -2, p1 = -1, p2 = 0 to find second complex root');
mueler(f, -2, -1, 0, 100, 10^(-6));
disp('Assuming complex conjugates also exist');
disp('~~~~~~~~~~');


% Problem 2
disp('Problem 1');
disp('----------');
disp('Finding a solution to e^(6x) + 1.441e^(2x) - 2.079e^(4x) - 0.3330 = 0 on [-1,0]');
disp('Chose to use Newton''s Method');
% This function is easily differentiable, so we can use Newton's method
f = @(x) exp(6*x) + 1.441*exp(2*x) - 2.079 * exp(4*x) - 0.3330;
fp = @(x) 6*exp(6*x) + (2*1.441)*exp(2*x) - (4*2.079)*exp(4*x);

newton(f, fp, -0.5, 100, 10^(-5));



% Output
% p2
% Problem 1
% ----------
% Finding roots of f(x)=x^5-x^4+2*x^3 - 3*x^2 + x - 4
% Part (a): Newton's Method
% Using p0 = 1.5
% Found root 1.4982 after 4 iterations.
% ~~~~~~~~~~
% Part (b): Secant Method
% Using p0 = 1.5, p1 = 1.501
% Found root 1.4982 after 5 iterations.
% ~~~~~~~~~~
% Part (c): Mueler's Method
% Using values close to Secant values to find the real root
% Found root 1.4982 after 5 iterations.
% Using p0 = -5, p1 = -4.5, p2 = -4 to find first complex root
% Found root 0.26454+1.3284i after 18 iterations.
% Using p0 = -2, p1 = -1, p2 = 0 to find second complex root
% Found root -0.51363+1.0916i after 14 iterations.
% Assuming complex conjugates also exist
% ~~~~~~~~~~
% Problem 1
% ----------
% Finding a solution to e^(6x) + 1.441e^(2x) - 2.079e^(4x) - 0.3330 = 0 on [-1,0]
% Chose to use Newton's Method
% Found root -0.16961 after 14 iterations.
