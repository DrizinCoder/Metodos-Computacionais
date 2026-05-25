function [a1, a2, r2, Sy, Syx] = min_squares(xs, ys)
  n = length(xs);
  ny = length(ys);
  soma_x = 0; soma_y = 0; soma_xy = 0; soma_x2 = 0;

  if n ~= ny
    error("Tamanhos diferentes de x e y");
  endif

  % Primeiro Loop: Somatórios para os coeficientes
  for i = 1:n
    soma_x = soma_x + xs(i);
    soma_y = soma_y + ys(i);
    soma_xy = soma_xy + (xs(i) * ys(i));
    soma_x2 = soma_x2 + (xs(i)^2);
  endfor

  % Cálculo dos coeficientes da reta
  a1 = (n*soma_xy - soma_x*soma_y) / (n*soma_x2 - soma_x^2);
  a2 = (soma_y/n) - a1*(soma_x/n);

  % --- CÁLCULO DAS ESTATÍSTICAS ---
  y_media = soma_y / n;
  S1 = 0; % Resíduo em relação à média (St)
  S2 = 0; % Resíduo em relação ao ajuste (Sr)

  % Segundo Loop: Acumulando os quadrados dos desvios
  for i = 1:n
    S1 = S1 + (ys(i) - y_media)^2;
    S2 = S2 + (ys(i) - a2 - a1*xs(i))^2;
  endfor

  % Desvio padrão total (em relação à média)
  Sy = sqrt(S1 / (n - 1));

  % Erro-padrão da estimativa (em relação à reta)
  % Grau de liberdade para reta é n-2 porque estimamos 2 coeficientes (a1 e a2)
  Syx = sqrt(S2 / (n - 2));

  % Coeficiente de determinação (r²)
  r2 = (S1 - S2) / S1;

endfunction
