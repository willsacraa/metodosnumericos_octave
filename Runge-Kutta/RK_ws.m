function [t,y] = RK_ws(t,y,h,tf,func)

%% Function para resolver a EDO de qualquer
%% grau pelo método de HK de ordem 4

nv = size(y,2); %Número de colunas de y
i = 1;
y(i,1:nv) = y(1:nv);
t(i,1) = t;

while (t(i,1)<tf)
    %calculo da derivada em i
    K1(1:nv) = feval(func,t(i),y(i,1:nv));
    K2(1:nv) = feval(func,t(i)+h/2,y(i,1:nv)+K1*h/2);
    K3(1:nv) = feval(func,t(i)+h/2,y(i,1:nv)+K2*h/2);
    K4(1:nv) = feval(func,t(i)+h,y(i,1:nv)+K3*h);
    dydt(i,1:nv) = 1/6*(K1+2*K2+2*K3+K4);
    
    %incremento y e t
    t(i+1,1) = t(i) + h;
    y(i+1,1:nv) = y(i,1:nv) + h*dydt(i,1:nv);
    i = i + 1;
end