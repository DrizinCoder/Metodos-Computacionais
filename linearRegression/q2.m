% 1. Configuração do ambiente e inserção dos dados da tabela
% Colunas: [X1, X2]
X = [ 0,   0;
      2,   1;
      2.5, 2;
      1,   3;
      4,   6;
      7,   2 ];

% Coluna: Y
y = [ 5;
      10;
      9;
      0;
      3;
      27 ];

% 2. Execução da Regressão Linear Múltipla
% Retorna os coeficientes [c1; c2; c3] onde: Y_pred = c1 + c2*X1 + c3*X2
coef_multiplo = regressao_linear_multipla(X, y);

% 3. Predição nos pontos ORIGINAIS para cálculo do R²
n = length(y);
y_pred = zeros(n, 1);

for i = 1:n
    % y_pred = c1 + c2*X1 + c3*X2
    y_pred(i) = coef_multiplo(1) + coef_multiplo(2)*X(i,1) + coef_multiplo(3)*X(i,2);
end

% Calcula o R² usando a mesma função manual criada anteriormente
r2_multiplo = calcular_r2(y, y_pred);

% 4. Exibição dos Coeficientes e do R² no Terminal
disp("--- Coeficientes Obtidos (Regressão Múltipla) ---");
fprintf('c1 (Termo Independente): %0.4f\n', coef_multiplo(1));
fprintf('c2 (Coeficiente de X1):  %0.4f\n', coef_multiplo(2));
fprintf('c3 (Coeficiente de X2):  %0.4f\n\n', coef_multiplo(3));

disp("--- Coeficiente de Determinação (R²) ---");
fprintf('R² para Regressão Múltipla: %0.4f\n\n', r2_multiplo);

% 5. Geração de pontos para plotar o plano de ajuste suave (3D)
[X1_mesh, X2_mesh] = meshgrid(linspace(0, 8, 20), linspace(0, 7, 20));
Y_mesh = coef_multiplo(1) + coef_multiplo(2).*X1_mesh + coef_multiplo(3).*X2_mesh;

% 6. Plotagem do Gráfico 3D
figure;
% Plota os pontos reais da tabela como esferas pretas
plot3(X(:,1), X(:,2), y, 'ko', 'MarkerFaceColor', 'k', 'MarkerSize', 8);
hold on;

% Plota o plano gerado pela regressão
mesh(X1_mesh, X2_mesh, Y_mesh, 'FaceAlpha', 0.5);

grid on;
xlabel('Variável X1');
ylabel('Variável X2');
zlabel('Variável Dependente Y');
title('Regressão Linear Múltipla - Mínimos Quadrados (UEFS)');
legend('Dados da Tabela', 'Plano de Ajuste', 'Location', 'NorthEast');
view(3); % Força a visualização padrão em 3D
hold off;