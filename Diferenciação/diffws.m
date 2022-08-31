function dy = diffws(t,x)

% diferenciacao
n = length(t);

% diferencicao progressiva
i = 1;
dy(i) = (x(i+1)-x(i))/(t(i+1)-t(i));

% diferenciacao central
for i = 2:n-1
    dy(i) = (x(i+1)-x(i-1))/(t(i+1)-t(i-1));
end

%diferenciacao regressiva
i = n;
dy(i) = (x(i)-x(i-1))/(t(i)-t(i-1));
