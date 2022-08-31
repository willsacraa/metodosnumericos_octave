function dydt = funcedo(t,y)

%% Derivada da função EDO de 1ª ordem
%dydt = -0.1*(y-10);

%dydt = y*t**2 - 1.1*y;

%dydt = 1 - y;


%K1 = 300;
%K2 = 200;
%rho = 1000;
%Acano = 0.06;
%Atanque = 3.13;
%g = 9.81;
%dydt = (K1 + K2*cos(pi*t/12)-rho*Acano*sqrt(2*g*y))/(rho*Atanque);

%dydt = y*t^(2)-1.1*y;

dydt = t;