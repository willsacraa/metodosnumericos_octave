function I = simpson13(x,y)

% Metodo do Simpson 1/3 composto

h = x(2) - x(1);
n = (length(x) - 1);

I = y(1);

for i = 2:2:n
    I = I + 4*y(i);
end
for j = 3:2:n-1
    I = I + 2*y(j);
end
I = I + y(n+1);

I = I * h/3