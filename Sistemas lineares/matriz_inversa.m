function A_inv = matriz_inversa(A)
    n = size(A, 1);
    
    % Constrói a Matriz Identidade manualmente
    I = zeros(n, n);
    for i = 1:n
        I(i, i) = 1;
    end
    
    % Matriz Aumentada [A | I]
    AI = [A I];
    disp('Matriz Aumentada [A | I] Inicial:');
    disp(AI);

    for k = 1:n
        pivo = AI(k, k);
        AI(k, :) = AI(k, :) / pivo;
        
        for i = 1:n
            if i ~= k
                m = AI(i, k);
                AI(i, :) = AI(i, :) - m * AI(k, :);
            end
        end
        disp(['Passo ', num2str(k), ' completo:']);
        disp(AI);
    end
    
    % A inversa é a segunda metade da matriz resultante
    A_inv = AI(:, n+1:2*n);
end
