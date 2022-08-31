function [t,y] = heun_ws(t,y,h,tf,func)

%% Function para resolver a EDO de qualquer
%% grau pelo método de Heun

nv = size(y,2); %Número de colunas de y
i = 1;
y(i,1:nv) = y(1,1:nv);
t(i) = t;

while (t(i)<tf)
    %preditor
    pdydt(i,1:nv) = feval(func,t(i),y(i,1:nv));
    
    %incremento y e t
    t(i+1) = t(i) + h;
    y(i+1,1:nv) = y(i,1:nv) + h*pdydt(i,1:nv);
    cdy(i,1:nv) = (pdydt(i,1:nv)+feval(func,t(i+1),y(i+1,1:nv)))/2;
    y(i+1,1:nv) = y(i,1:nv) + h*cdy(i,1:nv);
    %
    i = i + 1;
end