﻿function dydt = funcedo2(t,vy)

%% Derivada da função EDO de 2ª ordem

y = vy(1);
z = vy(2);

%dydt(1,1) = -0.5*y(1,1);
%dydt(1,2) = 4-0,3*y(1,2)-0.1*y(1,1);

dydt(1,1) = -2*y+4*exp(-t);
dydt(1,2) = (-y*(z**2))/3;