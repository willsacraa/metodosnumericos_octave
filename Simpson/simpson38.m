function I = simpson38(x,y)

% Metodo do Simpson 3/8 composto

h = x(2) - x(1);
n = (length(x) - 1);

I = y(1);

for i = 2:3:n-1
    I = I + 3*y(i)+y(i+1);
end
for j = 4:3:n-2
    I = I + 2*y(j);
end
I = I + y(n+1);

I = I * (3*h/8)