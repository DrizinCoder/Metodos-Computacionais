function [A, b] = montar_sistema_polinomial(x, y, g)
    % x: Vetor da variável independente
    % y: Vetor da variável dependente
    % g: Grau do polinômio
    
    m = g + 1;          % Número de coeficientes a determinar
    n = length(x);      % Quantidade de pontos da amostra
    
    A = zeros(m, m);   % Inicializa a matriz A
    b = zeros(m, 1);   % Inicializa o vetor b (coluna)
    
    for i = 1:m
        k1 = i - 1;     % Variável auxiliar para a potência de x na linha i
        k2 = i - 1;     % Variável auxiliar para caminhar nas colunas
        
        for j = 1:m
            if (j == 1 && i == 1)
                A(1, 1) = n;
            else
                s = 0;   % Auxiliar de somatório
                for k = 1:n
                    s = s + x(k)^(k2);
                end
                A(i, j) = s;
                A(j, i) = s; % Aproveita a simetria da matriz
                k2 = k2 + 1;
            end
        end
        
        % Montagem do vetor b
        s = 0;
        if (i == 1)
            for k = 1:n
                s = s + y(k);
            end
        else
            for k = 1:n
                s = s + y(k) * x(k)^(k1);
            end
        end
        b(i) = s;
    end
end