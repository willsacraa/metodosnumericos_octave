function dy = diffws1(t,x)

%% Diferencicao 1 ordem, com passo constante epara dois pontos.

h = t(2)-t(1);

n = length(t);

% diferencicao progressiva
i = 1;
dy(i) = (x(i+1)-x(i))/h;

% diferenciacao central
for i = 2:n-1
    dy(i) = (x(i+1)-x(i-1))/(2*h);
end

%diferenciacao regressiva
i = n;
dy(i) = (x(i)-x(i-1))/h;
