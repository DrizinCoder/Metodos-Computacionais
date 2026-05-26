function c = gaussPivotParc(A, b)
    % Resolve o sistema Ax = b por Eliminação de Gauss com pivoteamento simples
    m = length(b);
    Ab = [A, b]; % Matriz aumentada
    
    for i = 1:m-1
        % Pivoteamento simples para evitar divisão por zero
        if Ab(i,i) == 0
            for k = i+1:m
                if Ab(k,i) ~= 0
                    Ab([i,k], :) = Ab([k,i], :);
                    break;
                end
            end
        end
        
        % Eliminação
        for j = i+1:m
            fator = Ab(j,i) / Ab(i,i);
            Ab(j,:) = Ab(j,:) - fator * Ab(i,:);
        end
    end
    
    % Substituição para trás
    c = zeros(m, 1);
    c(m) = Ab(m, end) / Ab(m, m);
    for i = m-1:-1:1
        soma = Ab(i, end);
        for j = i+1:m
            soma = soma - Ab(i, j) * c(j);
        end
        c(i) = soma / Ab(i, i);
    end
end