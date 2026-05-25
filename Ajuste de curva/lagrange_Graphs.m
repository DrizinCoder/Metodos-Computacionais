% 1. Dados do Problema (Questão 2 corrigida com 2.5)
xs = [0, 0.5, 1.0];
fxs = [1.3, 2.5, 0.9];
n = length(xs);

% 2. Vetor de pontos finos para renderizar as curvas contínuas no gráfico
x_plot = linspace(0, 1.0, 100);

% Inicializar matrizes para guardar os valores de y de cada curva
y_L0 = zeros(1, 100);
y_L1 = zeros(1, 100);
y_L2 = zeros(1, 100);
y_P2 = zeros(1, 100);

% 3. Calcular os valores de cada polinômio para o gráfico
for i = 1:100
    % Calcula os L_i para o ponto atual x_plot(i)
    L = Lterms(xs, x_plot(i), n);

    y_L0(i) = L(1);
    y_L1(i) = L(2);
    y_L2(i) = L(3);

    % Calcula o P2 final para o ponto atual
    y_P2(i) = lagrange(fxs, L, n);
endfor

% 4. Plotagem do Gráfico
figure;
hold on;
grid on;

% Plota os polinômios base L_i (linhas tracejadas ou normais)
plot(x_plot, y_L0, 'r--', 'LineWidth', 1.5);
plot(x_plot, y_L1, 'g--', 'LineWidth', 1.5);
plot(x_plot, y_L2, 'b--', 'LineWidth', 1.5);

% Plota o polinômio interpolador P2 (linha contínua mais grossa)
plot(x_plot, y_P2, 'k-', 'LineWidth', 2.5);

% Plota os pontos originais da tabela (bolinhas pretas)
plot(xs, fxs, 'ko', 'MarkerFaceColor', 'k', 'MarkerSize', 8);

% Plota o ponto que você interpolou f(0.8) como um detalhe (estrela vermelha)
y_alvo = lagrange(fxs, Lterms(xs, 0.8, n), n);
plot(0.8, y_alvo, 'rx', 'MarkerSize', 12, 'LineWidth', 2);

% Configurações visuais do gráfico
title('Interpolação de Lagrange - Questão 2');
xlabel('Eixo X');
ylabel('Eixo Y');
legend('L_0(x)', 'L_1(x)', 'L_2(x)', 'P_2(x)', 'Pontos da Tabela', 'f(0.8) Interpolado', 'Location', 'northoutside', 'Orientation', 'horizontal');

hold off;
