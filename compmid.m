function t = compmid(a,b,f,n)

h = (b-a)/n; %this takes the end points and makes the distance of each step by dividing the interval by 
%the number of steps

sum = 0;
for i = 1: n
    w = (a+h*(i-1)+a+h*(i))/2;
    %this is the midpoint formula
    sum = sum + f(w);
end

t = h*sum;
end

