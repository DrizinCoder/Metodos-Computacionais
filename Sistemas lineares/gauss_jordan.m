function x = gauss_jordan(A, b)
    n = size(A, 1);
    Ab = [A b];

    disp('Matriz Aumentada Inicial:');
    disp(Ab);

    for k = 1:n
        % Normaliza a linha do pivô para que ele vire 1
        pivo = Ab(k, k);
        Ab(k, :) = Ab(k, :) / pivo;
        
        % Zera os elementos das outras linhas (acima e abaixo)
        for i = 1:n
            if i ~= k
                m = Ab(i, k);
                Ab(i, :) = Ab(i, :) - m * Ab(k, :);
            end
        end
        disp(['Matriz após iteração do pivô ', num2str(k), ':']);
        disp(Ab);
    end

    x = Ab(:, n+1); % A última coluna já contém a solução
end
