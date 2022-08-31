clc
clear
close all

%k = 0.835;
dt = 0.1;
dx = 0.1;
L = 1;
tf = 12;
kmax = tf/dt;
lambda = dt/dx^2;

Tx0 = 0;
TxL = 0;
n = L/dx; %10/2=5
%n-1 pontos internos, incógnitas

% x1 x2  x3  x4  x5  x6
% 0  2   4   6  8  10

T0 = 0*ones(n-1,1);
k=1; %condicao inicial
T(1:n+1,k) = [Tx0;T0;TxL];
T(1,1:kmax+1) = Tx0;
T(n+1,1:kmax+1) = TxL;
vt(k)= 0;

for k=1:kmax
  vt(k+1) = vt(k)+dt;
  for i =2
    T(i,k) = (-lambda*T(i-1,k+1) + 2*(lambda+1)*T(i,k+1) - lambda*T(i+1,k+1) - lambda*T(i-1,k) - lambda*T(i+1,k))/(2*(1-lambda));
  endfor
  for i=3:n-1
    T(i,k) = (-lambda*T(i-1,k+1) + 2*(lambda+1)*T(i,k+1) - lambda*T(i+1,k+1) - lambda*T(i-1,k) - lambda*T(i+1,k))/(2*(1-lambda));
  endfor
  for i = n
    T(i,k) = (-lambda*T(i-1,k+1) + 2*(lambda+1)*T(i,k+1) - lambda*T(i+1,k+1) - lambda*T(i-1,k) - lambda*T(i+1,k))/(2*(1-lambda));
  endfor
endfor

plot(0:dx:L,T(1:n+1,kmax+1),'o-k')
hold on
plot(0:dx:L,T(1:n+1,3*(kmax)/4+1),'o-g')
hold on
plot(0:dx:L,T(1:n+1,2*(kmax)/4+1),'o-m')
hold on
plot(0:dx:L,T(1:n+1,1*(kmax)/4+1),'o-b')
ylabel('Temperatura (^oC)')
xlabel('x (cm)')
legend('t=12s','t=9','t=6s','t=3s')
title('Perfil de Temperatura na barra ao longo do comprimento')
hold off

figure
plot(vt,T(n,1:kmax+1))
xlabel('tempo (s)')
ylabel('Temperatura (^oC)')
title('Perfil dinamico de Temperatura no ponto x')
legend('x=8cm')






