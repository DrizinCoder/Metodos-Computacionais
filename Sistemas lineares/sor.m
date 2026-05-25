function [x, k, historico_erros] = sor(A, b, x0, tol, max_iter, omega)
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
        warning('Matriz nao atende ao criterio de Sassenfeld. SOR pode divergir.');
    end

    % --- CÁLCULO E EXIBIÇÃO MATRICIAL DO SOR ---
    D = diag(diag(A));
    L = tril(A) - D;
    U = triu(A) - D;

    C_sor = inv(D + omega * L) * ((1 - omega) * D - omega * U);
    d_sor = omega * inv(D + omega * L) * b;

    fprintf('\n=======================================================\n');
    fprintf('          SISTEMA NO FORMATO DE MATRIZ (SOR)           \n');
    fprintf('=======================================================\n');
    disp('Matriz Componente (D + w*L):'), disp(D + omega * L)
    disp('Matriz Componente ((1-w)*D - w*U):'), disp((1 - omega) * D - omega * U)
    fprintf('-------------------------------------------------------\n');
    disp('Matriz de Iteracao Final C_sor:'), disp(C_sor)
    disp('Vetor de Carga Final d_sor:'), disp(d_sor)

    fprintf('=======================================================\n');
    fprintf('               EVOLUÇÃO SOR (w = %.2f)                 \n', omega);
    fprintf('=======================================================\n');
    fprintf('%-5s | ', 'Iter');
    for i = 1:n
        fprintf('%-10s | ', ['x' num2str(i)]);
    end
    fprintf('%-10s\n', 'Erro');
    fprintf('%s\n', repmat('-', 1, 11 + n*15));

    % Iterações do SOR
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
            % Calcula o termo da mesma forma que em Gauss-Seidel
            x_gs = (b(i) - soma) / A(i, i);

            % Aplica o ajuste de relaxação ponderado por omega
            x(i) = omega * x_gs + (1 - omega) * x_antigo(i);
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
    warning('SOR atingiu o maximo de iteracoes.');
end
