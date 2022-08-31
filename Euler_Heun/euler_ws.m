function [t,y] = euler_ws(t,y,h,tf,func)

%% Function para resolver a EDO de qualquer
%% grau pelo método de Euler

nv = size(y,2); %Número de colunas de y
i = 1;
y(i,1:nv) = y(1:nv);
t(i,1) = t;

while (t(i,1)<tf)
    %calculo da derivada em i
    dydt(i,1:nv) = feval(func,t(i),y(i,1:nv));
    
    %incremento y e t
    t(i+1,1) = t(i) + h;
    y(i+1,1:nv) = y(i,1:nv) + h*dydt(i,1:nv);
    i = i + 1;
end