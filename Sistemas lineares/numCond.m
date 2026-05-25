clear; clc;

% --- DADOS DA QUESTÃO 7 ---
x1 = 4;
x2 = 2;
x3 = 7;

% Montando a matriz de Vandermonde conforme a imagem
A = [ x1^2,  x1,  1;
      x2^2,  x2,  1;
      x3^2,  x3,  1 ];

% Calculando a inversa da matriz
A_inv = inv(A);

% Calculando a norma da soma das linhas (Norma Infinito)
% norm(M, inf) soma os valores absolutos de cada linha e pega o maior valor.
norma_A = norm(A, inf);
norma_A_inv = norm(A_inv, inf);

% Número de condição
num_condicao = norma_A * norma_A_inv;

% --- EXIBIÇÃO DOS RESULTADOS NO TERMINAL ---
fprintf('=======================================================\n');
fprintf('         ANÁLISE DE CONDICIONAMENTO (VANDERMONDE)       \n');
fprintf('=======================================================\n');
disp('Matriz A:'), disp(A)
disp('Matriz Inversa A^-1:'), disp(A_inv)
fprintf('-------------------------------------------------------\n');
fprintf('Norma de A (Soma das Linhas): %.4f\n', norma_A);
fprintf('Norma de A^-1 (Soma das Linhas): %.4f\n', norma_A_inv);
fprintf('=======================================================\n');
fprintf('NÚMERO DE CONDIÇÃO cond(A)_inf: %.4f\n', num_condicao);
fprintf('=======================================================\n');
