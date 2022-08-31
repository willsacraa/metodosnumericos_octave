clc
clear
close all

%% Pratica do Grupo D - Questao 2


%Condicoes inicias
Dab = 3*10^(-7)*60*60; %Coeficiente de difusao
R = 0.326; %raio final
n = 6; %passo
tf = 48; %tempo final
dr = R/n; %delta do raio
dt = 0.5; %delta do tempo
kmax = tf; %tempo maximo
lambda = Dab*dt/dr^2; %constante de calculo

%Condicoes de contorno
CxR = 0; 
Cx0 = 68.9; 
C = Cx0*ones(n,1);
k = 1;
CA(1:n+1,k) = Cx0;
CA(n+1,2:kmax+1) = CxR;
vt(k) = 0;


r(n) = 0;

for i = 1:n
  r(i+1) = r(i) + dr;
endfor

%% Calculo das concentracoes pelo tempo e pelo raio

for k = 1:kmax
  vt(k+1) = vt(k) + dt;

  CA(1,k+1) = (lambda*(CA(2,k)-2*CA(1,k) + CA(2,k))) + CA(1,k);
 
  for i = 2:n
    lambda_2 = 2*Dab*dt/(dr*r(i));
    CA(i,k+1) = (lambda*(CA(i+1,k)-2*CA(i,k) + CA(i-1,k))) + CA(i,k) + (lambda_2*(CA(i+1,k) - CA(i,k)));
  endfor
endfor

%Perfil da concentracao no raio 0 em qualquer tempo CA(0,t)
disp('Perfil de concentracao no raio 0 em qualquer tempo')
CA(1,:)'

%Graficos
plot(0:dr:R,CA(1:n+1,kmax+1),'o-k')
hold on
plot(0:dr:R,CA(1:n+1,48/2),'o-b')
hold on
plot(0:dr:R,CA(1:n+1,48/12),'o-r')
xlabel('comprimento radial (cm)')
ylabel('concentracao da droga (mg/cm3)')
legend('24 h', '12 h', '3 h')