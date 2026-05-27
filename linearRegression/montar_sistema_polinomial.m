function [A, b] = montar_sistema_polinomial(x, y, g)
    m = g + 1;          % Número de coeficientes a determinar
    n = length(x);      % Quantidade de pontos da amostra
    
    A = zeros(m, m);
    b = zeros(m, 1);
    
    for i = 1:m
        % Montagem da matriz A aproveitando a regra i + j - 2
        for j = 1:m
            s = 0;
            for k = 1:n
                s = s + x(k)^(i + j - 2);
            end
            A(i, j) = s;
        end
        
        % Montagem do vetor b (potência é apenas i - 1)
        s = 0;
        for k = 1:n
            s = s + y(k) * x(k)^(i - 1);
        end
        b(i) = s;
    end
end
