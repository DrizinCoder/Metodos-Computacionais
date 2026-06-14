function I = simpson_composto_for(f, a, b, n)
    % Validação: n precisa ser par
    if mod(n, 2) ~= 0
        error('Para o método de Simpson, o número de subintervalos (n) deve ser par.');
    end

    h = (b - a) / n;

    % Inicializa os somatórios
    soma_impares = 0;
    soma_pares = 0;

    % Laço de i = 1 até n-1
    for i = 1:(n - 1)
        xi = a + i * h;

        % Verifica se o índice i é par ou ímpar
        if mod(i, 2) == 0
            % Se 'i' for par, vai para o somatório dos pares
            soma_pares = soma_pares + f(xi);
        else
            % Se 'i' for ímpar, vai para o somatório dos ímpares
            soma_impares = soma_impares + f(xi);
        end
    end

    % Aplica a fórmula final
    I = (h / 3) * (f(a) + 4 * soma_impares + 2 * soma_pares + f(b));
endfunction
