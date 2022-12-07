%computes the explicit trapezoid which is the approximation of a
%differential equation. 
%inputs are the initial value y0, the interval [a,b], the function, the
%exact function derived from the function and the number of steps needed.

function [t,w,g] = etrap(y0,a,b,f,r,n)

t= zeros(1,n+1);
w = zeros(1,n+1);
g = zeros(1,n+1);
%initializing the array to store the data 

%sets the first value to be the initial value
w(1,1) = y0;

h = (b-a)/n;
t(1,1)= a;
for i =1:n+1
    t(1,i+1)= t(1,i)+h;
    w(1,i+1) = w(1,i) + (h/2)*(f(t(1,i),w(1,i))+f(t(1,i)+h,w(1,i)+h*f(t(1,i),w(1,i))));
    g(1,i) = abs(w(1,i)-r(t(1,i)));

    
end
end

