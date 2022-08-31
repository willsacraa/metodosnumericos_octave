function Tsol = lab(T0,Tx0,TxL,TyL,klin)
  
  %Function - Grupo D - Questao 1
  
  n = size(T0,1) +1;
  kmax = 100;
  tol = 0.01;
  lambda = 1.5;
  
  T(1:n+1,1,1:kmax) = Tx0;
  T(1:n+1,n+1,1:kmax) = TxL;
  T(1,1:n+1,1:kmax) = TyL;
  
  k = 1;
  T(2:n,2:n,k) = T0;
  
  % Calculo da Temperatura em y0
  for k = 1:kmax
    for i = 1:n+1
      for j = 2:n
        T(n+1,j,k) = klin*(2*T(1,j,k) + T(n+1,j+1,k) + T(n+1,j-1,k))/4;
      endfor
    endfor
  endfor
  
  %Calculo das demais Temperaturas
  for k = 1:kmax-1
    for i=2:n
      for j=2:n
        T(i,j,k+1) = (T(i+1,j,k)+T(i-1,j,k+1)+T(i,j+1,k)+T(i,j-1,k+1))/4;
        T(i,j,k+1) = lambda*T(i,j,k+1)+(1-lambda)*T(i,j,k);
      endfor
    endfor
  
    %verificar os erros
    cont = 0;
    for i=2:n
      for j=2:n
        erro(i,j) = abs((T(i,j,k+1)-T(i,j,k))/T(i,j,k+1));
        if erro(i,j)<tol
          cont = cont+1;
        endif
      endfor
    endfor
  
    if cont == (n-1)^2
      %convergiu, todas as variaveis satisfazem criterio do erro
      Tsol(1:n+1,1:n+1) = T(1:n+1,1:n+1,k+1);
      kfim = k+1;
      break;
    endif
  endfor
  
