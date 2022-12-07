function t = compsimp(a,b,f,n)

h = (b-a)/(2*n);

sumodds = 0;
for i = 1:n
    x = a + (2*i-1)*h;
    sumodds = sumodds + f(x);
end

sumevens = 0;
for i = 1:(n-1)
    x = a + (2*i)*h;
    sumevens = sumevens + f(x);
end

t = (h/3)*(f(a)+ f(b)+4*sumodds+2*sumevens);

end

