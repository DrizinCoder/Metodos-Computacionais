function [x, k, historico_erros] = sor(A, b, x0, tol, max_iter, omega)
    n = size(A, 1);

    % Critério de Sassenfeld (mesma checagem do Seidel)
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
        warning('Matriz nao atende ao criterio de Sassenfeld. SOR pode divergir.');
    end

    fprintf('\n=======================================================\n');
    fprintf('               EVOLUCAO SOR (w = %.2f)                 \n', omega);
    fprintf('=======================================================\n');
    fprintf('%-5s | ', 'Iter');
    for i = 1:n
        fprintf('%-10s | ', ['x' num2str(i)]);
    end
    fprintf('%-10s\n', 'Erro');
    fprintf('%s\n', repmat('-', 1, 11 + n*15));

    historico_erros = [];
    x = x0;
    
    for k = 1:max_iter
        x_antigo = x;
        for i = 1:n
            soma = 0;
            for j = 1:n
                if i ~= j
                    soma = soma + A(i, j) * x(j);
                end
            end
            x_gs = (b(i) - soma) / A(i, i);
            x(i) = omega * x_gs + (1 - omega) * x_antigo(i);
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
    warning('SOR atingiu o maximo de iteracoes sem convergir.');
end
