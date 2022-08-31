clc
clear 


k = 0.835;
lambda = 0.020875;
dx = 2;
L = 10;
n = L/dx-1;
dt = 0.1;

lambda = k*dt/dx^2;
tf = 12;
nk = tf/dt +1;

%condicao inicial
Tinit = 0;
%condicao de contorno
T0 = 100;
TL = 50;
% metodo implicito
T= zeros(n+2,nk);   %inicializar matriz T
T(1,:) = T0;        % CC
T(n+2,:) = TL;      % CC
T(2:n+1,1) = Tinit; % CI

%matriz de elementos constante
A=zeros(n); %
for i =1:n
    A(i,i) = 1+2*lambda;
    if i<n
        A(i,i+1) = -lambda;
    end
    if i>1
        A(i,i-1) = -lambda;
    end    
end

Tx(1:n,1) = ones(n,1)*Tinit;
for j=1:nk-1
    b = Tx(1:n,j);
    b(1) = b(1) + lambda*T0;
    b(n) = b(n) + lambda*TL;
    Tx(:,j+1) = inv(A)*b;
end
T(2:n+1,:)= Tx(:,:);

ct1 = fix(nk/3); ct2=fix(nk/3*2);
plot(0:dx:L,T(:,ct1),0:dx:L,T(:,ct2),0:dx:L,T(:,end))
title('solução EDP parabolica - metodo implicito')
xlabel('x (m)')
ylabel('T (^oC)')
