function [x, k, historico_erros] = GaussJacobi(A, b, x0, tol, max_iter)
      % Verifica o Critério de Linhas
    n = size(A, 1);
    criterio_atendido = true;
    for i = 1:n
        soma_linha = sum(abs(A(i, :))) - abs(A(i, i));
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
    C = zeros(n);
    d = zeros(n, 1);
    for i = 1:n
        d(i) = b(i) / A(i, i);
        for j = 1:n
            if i ~= j
                C(i, j) = -A(i, j) / A(i, i);
            end
        end
    end

    % --- EXIBIÇÃO DAS MATRIZES DO SISTEMA ITERATIVO ---
    fprintf('\n=======================================================\n');
    fprintf('        SISTEMA NO FORMATO DE MATRIZ (JACOBI)          \n');
    fprintf('=======================================================\n');
    disp('Matriz de Iteracao C:'), disp(C)
    disp('Vetor de Carga d:'), disp(d)

    fprintf('=======================================================\n');
    fprintf('                  EVOLUÇÃO JACOBI                      \n');
    fprintf('=======================================================\n');
    fprintf('%-5s | ', 'Iter');
    for i = 1:n
        fprintf('%-10s | ', ['x' num2str(i)]);
    end
    fprintf('%-10s\n', 'Erro');
    fprintf('%s\n', repmat('-', 1, 11 + n*15));

    % Processo Iterativo
    historico_erros = [];
    x_antigo = x0;
    for k = 1:max_iter
        x = C * x_antigo + d;

        % Critério de parada: erro relativo percentual
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
        x_antigo = x;
    end
    warning('O metodo atingiu o numero maximo de iteracoes sem convergir.');
end
