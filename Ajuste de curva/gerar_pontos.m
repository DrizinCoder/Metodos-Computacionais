function [X, Y] = gerar_pontos()
    % Configuração
    n = 100;                 % número de pontos
    a = 0;                   % início do intervalo
    b = 15;                  % fim do intervalo

    % Gerar X como vetor COLUNA
    X = linspace(a, b, n)';

    % FUNÇÃO GERADORA
    e = 0.7 * rand(n, 1);
    Y = sin(X/1.5) + 0.1*X + e;

    fprintf('Pontos gerados com sucesso!\n');
end
