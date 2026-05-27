function plotar_convergencia(vetor_erros, nome_metodo)
    % Cria um vetor de iterações (1, 2, 3, ... até o tamanho do vetor de erros)
    iteracoes = 1:length(vetor_erros);
    
    % Cria uma nova janela de figura para não sobrescrever a anterior
    figure;
    
    % Plota o gráfico com linhas e marcadores circulares
    plot(iteracoes, vetor_erros, '-o', 'LineWidth', 2, 'MarkerSize', 6, 'MarkerFaceColor', 'b');
    
    % Formatação do gráfico
    title(['Curva de Convergência - ', nome_metodo]);
    xlabel('Número de Iterações');
    ylabel('Erro Relativo Percentual (\epsilon_a %)');
    grid on;
end
