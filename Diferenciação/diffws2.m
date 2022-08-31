function dy = diffws2(t,x)

%% Diferencicao 2 ordem, com passo constante e erro O(h^2)

h = t(2)-t(1);

n = length(t);

% diferencicao progressiva
i = 1;
dy(i) = (2*x(i)-5*x(i+1)+4*x(i+2)-x(i+3))/(h**2);

% diferenciacao central
for i = 2:n-1
    dy(i) = (x(i-1)-2*x(i)+x(i+1))/(h**2);
end

%diferenciacao regressiva
i = n;
dy(i) = (-x(i-3)+4*x(i-2)-5*x(i-1)+2*x(i))/(h**2);
