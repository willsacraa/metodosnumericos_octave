function [dTdz] = funcenerg_GD(x,z) 

%% Caso de estudo - Grupo D - Bruna, Debora e William
%% Function para encontrar a temperatura

rhocat = 1775; %Densidade (kg/m3)
epb = 0.5; %Porosidade
T = 493.2; %Temperatura inicial (K)
M = 2.8*10^(-5); %Massa (10^-5 kg/s)
diam = 0.016; %Diametro (m)
compr = 0.15; %Comprimento (m)
dH = [-49.5 41.2]; %Entalpia (kJ/mol)
Cp = [35.519 74.620 102.51 29.966 75.344 29.25]; %Capacidade Calorifica
MW = [28 18 32.04 2 44.28 28]; %Peso molecular
v = [0 1
     1 1
     1 0
     3 1
     1 1
     1 1]; %Coeficiente estequiometrico
P = 50; %Pressao (bar)
R = 8.3144; %Constante dos gases
K = [1.07 3453.38 0.499 6.62*10^(-11) 1.22*10^(10)
      36696 0 17197 124119 -94765
      1 2 0 0 0
      3066 -2073 0 0 0 
      -10.592 2.029 0 0 0]'; %Parametro cinetico
w = [4 0 0 82 3 11]; %condicao inicial

      
      
Aint = 2*(pi*(diam/2)^2) + (2*(diam/2)*compr); %Area do reator
for i = 1:5
  k(i) = K(i,1) * exp(K(i,2)/(R*T)); %constantes cineticas
endfor
Keq(1) = exp((K(1,4)/T) + K(1,5)); %Constante de equilibrio da reacao A
Keq(2) = exp((K(2,4)/T) + K(2,5)); %Constante de equilibrio da reacao B




%% Calculo de MW - Peso molecular
soma1 = 0;
for i = 1:length(MW)
  soma1 = (w(i)/MW(i)) + soma1;
endfor
MWT = 1/soma1;

%% Calculo de yi - Fracao molar
for i = 1:length(MW)
  y(i) = (w(i)/MW(i))*MWT;
endfor

%% Calculo de pi - Pressao parcial
for i = 1:length(MW)
  p(i) = y(i)*P;
endfor

%% Taxas de reacao
r(1) = (k(1) * p(5) * p(4) * (1 - (p(3)*p(2))/(Keq(1)*p(5)*(p(4)^3))))/(1 + 
          k(2) * p(2)/p(4) + k(3)*sqrt(p(4)) + k(4)*p(2))^2;
r(2) = (k(5) * p(5) * (1 - (p(1)*p(2))/(Keq(2)*p(4)*p(5))))/(1 + 
          k(2) * p(2)/p(4) + k(3)*sqrt(p(4)) + k(4)*p(2));


%% Calculo de Cpmix - Capacidade calorifica da mistura
soma2 = 0;
for i = 1:length(MW)
  soma2 = (Cp(i)*w(i)/MW(i)) + soma2;
endfor
Cpmix = (10^3)*(soma2);

 
dTdz = (Aint/(M*Cpmix))* rhocat * (1 - epb) * (-1*(dH(1)*r(1) + dH(2)*r(2)));

endfunction