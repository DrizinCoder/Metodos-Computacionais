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
    if max(beta) >= 1
        warning('Matriz nao atende ao criterio de Sassenfeld para Gauss-Seidel.');
    end

    % --- CÁLCULO E EXIBIÇÃO MATRICIAL DO SEIDEL ---
    D = diag(diag(A));
    L = tril(A) - D;
    U = triu(A) - D;

    C_gs = -inv(D + L) * U;
    d_gs = inv(D + L) * b;

    fprintf('\n=======================================================\n');
    fprintf('     SISTEMA NO FORMATO DE MATRIZ (GAUSS-SEIDEL)       \n');
    fprintf('=======================================================\n');
    disp('Matriz de Iteracao C_gs:'), disp(C_gs)
    disp('Vetor de Carga d_gs:'), disp(d_gs)

    fprintf('=======================================================\n');
    fprintf('               EVOLUÇÃO GAUSS-SEIDEL                   \n');
    fprintf('=======================================================\n');
    fprintf('%-5s | ', 'Iter');
    for i = 1:n
        fprintf('%-10s | ', ['x' num2str(i)]);
    end
    fprintf('%-10s\n', 'Erro');
    fprintf('%s\n', repmat('-', 1, 11 + n*15));

    % Iterações de Seidel
    x = x0;
    historico_erros = []
    for k = 1:max_iter
        x_antigo = x;
        for i = 1:n
            soma = 0;
            for j = 1:n
                if i ~= j
                    soma = soma + A(i, j) * x(j);
                end
            end
            % Atualiza diretamente na variável x para usar o valor mais recente
            x(i) = (b(i) - soma) / A(i, i);
        end

        erro = max(abs((x - x_antigo) ./ x));
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
    warning('Gauss-Seidel atingiu o maximo de iteracoes.');
end
