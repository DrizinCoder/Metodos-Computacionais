function [L, U] = decomposicao_LU(A)
    n = size(A, 1);
    L = zeros(n, n);
    U = zeros(n, n);
    
    % Construção manual da diagonal principal de L com 1s
    for i = 1:n
        L(i, i) = 1;
    end

    for k = 1:n
        % Preenche U (linha k)
        for j = k:n
            soma = 0;
            for p = 1:k-1
                soma = soma + L(k, p) * U(p, j);
            end
            U(k, j) = A(k, j) - soma;
        end
        
        % Preenche L (coluna k)
        for i = k+1:n
            soma = 0;
            for p = 1:k-1
                soma = soma + L(i, p) * U(p, k);
            end
            L(i, k) = (A(i, k) - soma) / U(k, k);
        end
        
        disp(['Iteração ', num2str(k), ' - Matriz L:']);
        disp(L);
        disp(['Iteração ', num2str(k), ' - Matriz U:']);
        disp(U);
    end
end
