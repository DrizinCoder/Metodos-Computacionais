function cond_A = numero_condicao(A)
    n = size(A, 1);
    
    % 1. Calcular Norma Infinito de A manualmente
    norma_inf_A = 0;
    for i = 1:n
        soma_linha = 0;
        for j = 1:n
            soma_linha = soma_linha + abs(A(i, j));
        end
        if soma_linha > norma_inf_A
            norma_inf_A = soma_linha;
        end
    end
    
    % 2. Calcular Inversa de A manualmente (método de Gauss-Jordan)
    I = zeros(n, n);
    for i = 1:n
        I(i, i) = 1;
    end
    AI = [A I];
    
    for k = 1:n
        pivo = AI(k, k);
        AI(k, :) = AI(k, :) / pivo;
        for i = 1:n
            if i ~= k
                m = AI(i, k);
                AI(i, :) = AI(i, :) - m * AI(k, :);
            end
        end
    end
    A_inv = AI(:, n+1:2*n);
    
    % 3. Calcular Norma Infinito da Inversa manualmente
    norma_inf_A_inv = 0;
    for i = 1:n
        soma_linha = 0;
        for j = 1:n
            soma_linha = soma_linha + abs(A_inv(i, j));
        end
        if soma_linha > norma_inf_A_inv
            norma_inf_A_inv = soma_linha;
        end
    end
    
    % 4. Número Condição
    cond_A = norma_inf_A * norma_inf_A_inv;
    
    disp(['Norma Infinita de A: ', num2str(norma_inf_A)]);
    disp(['Norma Infinita de A_inv: ', num2str(norma_inf_A_inv)]);
end
