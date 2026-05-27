function [x, k, historico_erros] = GaussSeidel(A, b, x0, tol, max_iter)
    n = size(A, 1);

    % Critério de Sassenfeld
    beta = zeros(n, 1);
    for i = 1:n
        soma = 0;
        for j = 1:i-1
            soma = soma + abs(A(i, j)) * beta(j);
        end
        for j = i+1:n
            soma = soma + abs(A(i, j));
        end
        beta(i) = soma / abs(A(i, i));
    end
    
    max_beta = 0;
    for i=1:n
        if beta(i) > max_beta
            max_beta = beta(i);
        end
    end
    
    if max_beta >= 1
        warning('Matriz nao atende ao criterio de Sassenfeld para Gauss-Seidel.');
    else
        disp('Criterio de Sassenfeld atendido com sucesso!');
    end

    fprintf('\n=======================================================\n');
    fprintf('               EVOLUCAO GAUSS-SEIDEL                   \n');
    fprintf('=======================================================\n');
    fprintf('%-5s | ', 'Iter');
    for i = 1:n
        fprintf('%-10s | ', ['x' num2str(i)]);
    end
    fprintf('%-10s\n', 'Erro');
    fprintf('%s\n', repmat('-', 1, 11 + n*15));

    x = x0;
    historico_erros = [];
    
    for k = 1:max_iter
        x_antigo = x;
        for i = 1:n
            soma = 0;
            for j = 1:n
                if i ~= j
                    soma = soma + A(i, j) * x(j);
                end
            end
            x(i) = (b(i) - soma) / A(i, i);
        end

        % Cálculo seguro do erro relativo
        max_diff = 0;
        max_x = 0;
        for i = 1:n
            if abs(x(i) - x_antigo(i)) > max_diff
                max_diff = abs(x(i) - x_antigo(i));
            end
            if abs(x(i)) > max_x
                max_x = abs(x(i));
            end
        end
        erro = max_diff / max_x;
        
        historico_erros(k) = erro;

        fprintf('%-5d | ', k);
        for i = 1:n
            fprintf('%-10.4f | ', x(i));
        end
        fprintf('%-10.6f\n', erro);

        if erro < tol
            return;
        end
    end
    warning('Gauss-Seidel atingiu o maximo de iteracoes sem convergir.');
end
