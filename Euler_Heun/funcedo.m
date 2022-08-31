function dydt = funcedo(t,y)

%% Derivada da função EDO de 1ª ordem
%dydt = -0.1*(y-10);

dydt = y*t**2 - 1.1*y;