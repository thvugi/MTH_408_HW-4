%Program 5.2 Adaptive Quadrature
% Computes approximation to definite integral
% Inputs: Matlab function f, interval [a0,b0],
%  error tolerance tol0, delta tolerance, and the rule like simpsons or
%  trapezoid
% Output: approximate definite integral
function [int,m]=adapquad(f,a0,b0,del,tol0,rule)
int=0; n=1; a(1)=a0; b(1)=b0; tol(1)=tol0; m=1;

switch rule
    case 'trap'
      
    app(1) = trap(f,a,b);
    while n>0              % n is current position at end of the list
    m = m + 1;
    c=(a(n)+b(n))/2; oldapp=app(n);
    app(n)=trap(f,a(n),c);app(n+1)=trap(f,c,b(n));
    if abs(oldapp-(app(n)+app(n+1)))<del*tol(n)
    int=int+app(n)+app(n+1);
    n=n-1;
    else
    b(n+1)=b(n); b(n)=c;
% success
% done with interval
% divide into two intervals
% set up new intervals
     a(n+1)=c;
tol(n)=tol(n)/2; tol(n+1)=tol(n);
n=n+1;                         % go to end of list, repeat
    end
end




    case 'simps'


    app(1) = simps(f,a,b);
    while n>0              % n is current position at end of the list
    m = m + 1;
    c=(a(n)+b(n))/2; oldapp=app(n);
    app(n)=simps(f,a(n),c);app(n+1)=simps(f,c,b(n));
    if abs(oldapp-(app(n)+app(n+1)))<del*tol(n)
    int=int+app(n)+app(n+1);
n=n-1; else
    b(n+1)=b(n); b(n)=c;
% success
% done with interval
% divide into two intervals
% set up new intervals
     a(n+1)=c;
tol(n)=tol(n)/2; tol(n+1)=tol(n);
n=n+1;                         % go to end of list, repeat
    end
    end
otherwise 

    end

function s=trap(f,a,b)
s=(f(a)+f(b))*(b-a)/2;

function si = simps(f,a,b)
si =(f(a)+f(b)+(4*(f((b+a)/2))))*((b-a)/6)