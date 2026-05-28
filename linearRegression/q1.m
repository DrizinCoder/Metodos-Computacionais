% 1. Configuração do ambiente e geração dos dados (100 amostras de 0 a 15)
[xs, fxs] = gerar_pontos();

coef_2  = regressao_polinomial(xs, fxs, 2);
coef_4  = regressao_polinomial(xs, fxs, 4);
coef_10 = regressao_polinomial(xs, fxs, 10);

y_pred_2 = predizer_polinomio(xs, coef_2);
y_pred_4 = predizer_polinomio(xs, coef_4);
y_pred_10 = predizer_polinomio(xs, coef_10);

r2_grau2  = calcular_r2(fxs, y_pred_2);
r2_grau4  = calcular_r2(fxs, y_pred_4);
r2_grau10 = calcular_r2(fxs, y_pred_10);

% 3. Exibição dos Coeficientes no Terminal
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

y_plot_2 = predizer_polinomio(x_plot, coef_2);
y_plot_4 = predizer_polinomio(x_plot, coef_4);
y_plot_10 = predizer_polinomio(x_plot, coef_10);
% 5. Plotagem do Gráfico
figure;
plot(xs, fxs, 'ko', 'MarkerFaceColor', 'k', 'MarkerSize', 4);
hold on;
plot(x_plot, y_plot_2, 'r-', 'LineWidth', 2);    % Grau 2
plot(x_plot, y_plot_4, 'g-', 'LineWidth', 2);    % Grau 4
plot(x_plot, y_plot_10, 'b-', 'LineWidth', 2);   % Grau 10

grid on;
xlabel('X');
ylabel('Y');
title('Ajuste Polinomial - Mínimos Quadrados');
legend('Amostra (100 pontos)', 'Grau 2', 'Grau 4', 'Grau 10', 'Location', 'NorthWest');
hold off;
