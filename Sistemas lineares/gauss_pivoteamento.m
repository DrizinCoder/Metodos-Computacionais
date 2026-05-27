function [x, det_A] = gauss_pivoteamento(A, b)
    n = size(A, 1);
    Ab = [A b];
    trocas = 0;

    disp('Matriz Aumentada Inicial:');
    disp(Ab);

    for k = 1:n-1
        % Busca manual do maior elemento em módulo na coluna k
        max_val = abs(Ab(k, k));
        linha_pivo = k;
        for i = k+1:n
            if abs(Ab(i, k)) > max_val
                max_val = abs(Ab(i, k));
                linha_pivo = i;
            end
        end
        
        % Troca de linhas se necessário
        if linha_pivo ~= k
            temp = Ab(k, :);
            Ab(k, :) = Ab(linha_pivo, :);
            Ab(linha_pivo, :) = temp;
            trocas = trocas + 1;
            disp(['Troca da linha ', num2str(k), ' com a linha ', num2str(linha_pivo), ':']);
            disp(Ab);
        end
        
        % Eliminação
        for i = k+1:n
            m = Ab(i, k) / Ab(k, k);
            Ab(i, k:n+1) = Ab(i, k:n+1) - m * Ab(k, k:n+1);
        end
        disp(['Matriz após eliminação na coluna ', num2str(k), ':']);
        disp(Ab);
    end

    % Substituição Reversa
    x = zeros(n, 1);
    x(n) = Ab(n, n+1) / Ab(n, n);
    for i = n-1:-1:1
        soma = 0;
        for j = i+1:n
            soma = soma + Ab(i, j) * x(j);
        end
        x(i) = (Ab(i, n+1) - soma) / Ab(i, i);
    end
    
    % Cálculo manual do determinante
    det_A = 1;
    for i = 1:n
        det_A = det_A * Ab(i, i);
    end
    det_A = det_A * ((-1)^trocas);
end
