function p1()

%problem 1
%Found root 0.125 after 3 iterations.
%bisect(@f, 0, 1, 3, 0)

%2a
%Found root -0.6875 after 3 iterations.
%bisect(@g, -2,1.5,3,0)

%2b
%Found root 1.0938 after 3 iterations.
%bisect(@g, -1.25,2.5,3,0)

%3a
%Found root 0.59375 after 5 iterations.
%bisect(@h, 0,1,100,10e-2)

%3b
%Found root 3.0281 after 6 iterations.
%bisect(@h, 1, 3.2, 100, 10e-2)

%3c
%Found root 3.45 after 4 iterations.
bisect(@h, 3.2, 4,100,10e-2)







function y=f(x)
y = sqrt(x) - cos(x);

function y=g(x)
y = 3*(x+1)*(x-.5)*(x-1);

function y=h(x)
y = x^3-7*x^2+14*x-6;