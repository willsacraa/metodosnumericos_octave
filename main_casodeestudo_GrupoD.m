clc
clear
close all

%% Caso de estudo - Grupo D - Bruna, Debora e William

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
quantmols = [4 0 0 82 3 11]; %Composicao molar (mol%)
P = 50; %Pressao (bar)
k = [1.07 3453.38 0.499 6.62*10^(-11) 1.22*10^(10)
      36696 0 17197 124119 -94765
      1 2 0 0 0
      3066 -2073 0 0 0 
      -10.592 2.029 0 0 0]'; %Parametro cinetico

Aint = 2*(pi*(diam/2)^2) + (2*(diam/2)*compr); %Area do reator
Keq(1) = exp((k(1,4)/T) + k(1,5)); %Constante de equilibrio da reacao A
Keq(2) = exp((k(2,4)/T) + k(2,5)); %Constante de equilibrio da reacao B


%%------------------------------------------------------------------------------

%Calculo da composicao e da temperatura ao longo do reator

w = [4 0 0 82 3 11]; %condicao inicial
[X,Y1] = ode45('funcmassa_GD',[0 0.15],w); %composicao

[X2,Y2] = ode45('funcenerg_GD',[0 0.15],T); %temperatura



%Grafico das Composicoes
subplot(5,1,1)
plot(X,Y1(:,1))
title('CO')
subplot(5,1,2)
plot(X,Y1(:,2))
title('H2O')
subplot(5,1,3)
plot(X,Y1(:,3))
title('MeOH')
subplot(5,1,4)
plot(X,Y1(:,4))
title('H2')
subplot(5,1,5)
plot(X,Y1(:,5))
title('CO2')
xlabel('Comprimento do reator (m)')

%% Vemos que enquanto a composicao de CO diminui, todas as outras aumentam


%Grafico da Temperatura
figure
plot([X2],[Y2])
ylabel('Temperatura (K)')
xlabel('Comprimento do reator (m)')