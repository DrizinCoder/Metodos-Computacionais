function [norma_1, norma_inf, norma_frob] = calcular_normas(A)
    [linhas, cols] = size(A);
    A_norm = zeros(linhas, cols);
    
    % 1. Normalizando a matriz (maior elemento de cada linha = 1)
    for i = 1:linhas
        max_linha = abs(A(i, 1));
        for j = 2:cols
            if abs(A(i, j)) > max_linha
                max_linha = abs(A(i, j));
            end
        end
        % Divide toda a linha pelo elemento de maior módulo
        A_norm(i, :) = A(i, :) / max_linha; 
    end
    
    disp('Matriz Normalizada:');
    disp(A_norm);
    
    % 2. Calculando Norma 1 (maior soma absoluta de colunas)
    norma_1 = 0;
    for j = 1:cols
        soma_col = 0;
        for i = 1:linhas
            soma_col = soma_col + abs(A_norm(i, j));
        end
        if soma_col > norma_1
            norma_1 = soma_col;
        end
    end
    
    % 3. Calculando Norma Infinito (maior soma absoluta de linhas)
    norma_inf = 0;
    for i = 1:linhas
        soma_linha = 0;
        for j = 1:cols
            soma_linha = soma_linha + abs(A_norm(i, j));
        end
        if soma_linha > norma_inf
            norma_inf = soma_linha;
        end
    end
    
    % 4. Calculando Norma de Frobenius (raiz da soma dos quadrados)
    soma_quad = 0;
    for i = 1:linhas
        for j = 1:cols
            soma_quad = soma_quad + (A_norm(i, j)^2);
        end
    end
    norma_frob = sqrt(soma_quad);
end
