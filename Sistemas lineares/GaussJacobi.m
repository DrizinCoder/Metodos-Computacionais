function [x, k, historico_erros] = GaussJacobi(A, b, x0, tol, max_iter)
    n = size(A, 1);
    
    % Verifica o Critério de Linhas (Totalmente manual)
    criterio_atendido = true;
    for i = 1:n
        soma_linha = 0;
        for j = 1:n
            if i ~= j
                soma_linha = soma_linha + abs(A(i, j));
            end
        end
        if abs(A(i, i)) <= soma_linha
            criterio_atendido = false;
        end
    end

    if ~criterio_atendido
        warning('A matriz nao atende ao criterio de linhas. Jacobi pode nao convergir.');
    else
        disp('Criterio de linhas atendido com sucesso!');
    end

    % Construção das matrizes de iteração C e d
    C = zeros(n, n);
    d = zeros(n, 1);
    for i = 1:n
        d(i) = b(i) / A(i, i);
        for j = 1:n
            if i ~= j
                C(i, j) = -A(i, j) / A(i, i);
            end
        end
    end

    fprintf('\n=======================================================\n');
    fprintf('        SISTEMA NO FORMATO DE MATRIZ (JACOBI)          \n');
    fprintf('=======================================================\n');
    disp('Matriz de Iteracao C:'), disp(C)
    disp('Vetor de Carga d:'), disp(d)

    fprintf('=======================================================\n');
    fprintf('                 EVOLUCAO JACOBI                       \n');
    fprintf('=======================================================\n');
    fprintf('%-5s | ', 'Iter');
    for i = 1:n
        fprintf('%-10s | ', ['x' num2str(i)]);
    end
    fprintf('%-10s\n', 'Erro');
    fprintf('%s\n', repmat('-', 1, 11 + n*15));

    historico_erros = [];
    x_antigo = x0;
    x = zeros(n, 1);
    
    for k = 1:max_iter
        % Iteração manual (x = C * x_antigo + d)
        for i = 1:n
            soma = 0;
            for j = 1:n
                soma = soma + C(i, j) * x_antigo(j);
            end
            x(i) = soma + d(i);
        end

        % Cálculo seguro do erro relativo (Norma Infinito)
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
        x_antigo = x;
    end
    warning('O metodo atingiu o numero maximo de iteracoes sem convergir.');
end
