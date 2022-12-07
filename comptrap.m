function t = comptrap(a,b,f,n)
%n is the number of steps and h is the length of each step
h = (b-a)/n;

%b and a are endpoints
sum = 0;%this will sum all of the middle values 
for i=1:n-1
    x = a+i*h;
    sum = sum + f(x);
end


t = (h/2)*(f(a)+f(b)+2*sum);


end

