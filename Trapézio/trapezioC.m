function I = trapezioC(x,y)

% Metodo do Trapezio composto

h = x(2) - x(1);
n = length(x) - 1;
I = y(1);

for i = 2:n
    I = I + 2*y(i);
end
I = I + y(n+1);

I = I * h/2
