function I = simpson_composto(f, a, b, n)
    % Validação de segurança: n precisa ser par
    if mod(n, 2) ~= 0
        error('Para o método de Simpson, o número de subintervalos (n) deve ser par.');
    end

    h = (b - a) / n;
    x = a:h:b;
    y = f(x);

    % No Octave, os índices começam em 1.
    % Portanto, x_0 = índice 1, x_1 = índice 2, x_2 = índice 3...
    % Os x de subíndices ímpares (x_1, x_3...) caem nos índices PARES do Octave.
    soma_impares = sum(y(2:2:end-1));

    % Os x de subíndices pares (x_2, x_4...) caem nos índices ÍMPARES do Octave.
    soma_pares = sum(y(3:2:end-2));

    % Aplica a fórmula
    I = (h / 3) * (y(1) + 4 * soma_impares + 2 * soma_pares + y(end));
endfunction
