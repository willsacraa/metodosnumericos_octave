b = 3;
a = 1;
n = 2;

h = (3-1)/2;

x = a:h:b;
for i=1:n+1
    % Se atentar a funcao funcint
    y(i) = funcint(x(i))
end

I = trapezioC (x,y)