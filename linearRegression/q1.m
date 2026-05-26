% 1. Configuração do ambiente e geração dos dados (100 amostras de 0 a 15)
n_amostras = 100;
xs = linspace(0, 15, n_amostras); % Vetor linha com 100 pontos entre 0 e 15

% Função original: y = sen(x/1.5) + 0.1x + e
ruido = 0.7 * rand(1, n_amostras); 
fxs = sin(xs ./ 1.5) + 0.1 * xs + ruido;

% 2. Execução das Regressões Polinomiais (Graus 2, 4 e 10)
xs = transpose(xs);
fxs = fxs';

coef_2  = regressao_polinomial(xs, fxs, 2);
coef_4  = regressao_polinomial(xs, fxs, 4);
coef_10 = regressao_polinomial(xs, fxs, 10);

y_pred_2  = zeros(size(xs));
y_pred_4  = zeros(size(xs));
y_pred_10 = zeros(size(xs));

for i = 1:length(coef_2)
    y_pred_2 = y_pred_2 + coef_2(i) * xs.^(i-1);
end
for i = 1:length(coef_4)
    y_pred_4 = y_pred_4 + coef_4(i) * xs.^(i-1);
end
for i = 1:length(coef_10)
    y_pred_10 = y_pred_10 + coef_10(i) * xs.^(i-1);
end

r2_grau2  = calcular_r2(fxs, y_pred_2);
r2_grau4  = calcular_r2(fxs, y_pred_4);
r2_grau10 = calcular_r2(fxs, y_pred_10);

% 3. Exibição dos Coeficientes no Terminal (Ajustado para formato coluna)
disp("--- Coeficientes Obtidos ---");
disp("Grau 2:"), disp(coef_2);
disp("----------------------------");
disp("Grau 4:"), disp(coef_4);
disp("----------------------------");
disp("Grau 10:"), disp(coef_10);

% Exibição dos valores de R² logo abaixo dos coeficientes
disp("--- Coeficientes de Determinação (R^2) ---");
fprintf('R^2 para Grau 2:  %0.4f\n', r2_grau2);
fprintf('R^2 para Grau 4:  %0.4f\n', r2_grau4);
fprintf('R^2 para Grau 10: %0.4f\n\n', r2_grau10);

% 4. Gerar pontos para plotar as curvas suaves de ajuste (200 pontos para o gráfico)
x_plot = linspace(0, 15, 200)';
y_2  = zeros(size(x_plot));
y_4  = zeros(size(x_plot));
y_10 = zeros(size(x_plot));

for i = 1:length(coef_2)
    y_2 = y_2 + coef_2(i) * x_plot.^(i-1);
end
for i = 1:length(coef_4)
    y_4 = y_4 + coef_4(i) * x_plot.^(i-1);
end
for i = 1:length(coef_10)
    y_10 = y_10 + coef_10(i) * x_plot.^(i-1);
end

% 5. Plotagem do Gráfico
figure;
plot(xs, fxs, 'ko', 'MarkerFaceColor', 'k', 'MarkerSize', 4);
hold on;
plot(x_plot, y_2, 'r-', 'LineWidth', 2);    % Grau 2
plot(x_plot, y_4, 'g-', 'LineWidth', 2);    % Grau 4
plot(x_plot, y_10, 'b-', 'LineWidth', 2);   % Grau 10

grid on;
xlabel('X');
ylabel('Y');
title('Ajuste Polinomial - Mínimos Quadrados (UEFS)');
legend('Amostra (100 pontos)', 'Grau 2', 'Grau 4', 'Grau 10', 'Location', 'NorthWest');
hold off;