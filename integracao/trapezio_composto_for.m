function I = trapezio_composto_for(f, a, b, n)
    % Passo da integração
    h = (b - a) / n;

    % Inicializa o somatório dos pontos internos
    soma = 0;

    % Laço para calcular o somatório de i = 1 até n-1
    for i = 1:(n - 1)
        % Calcula o x atual
        xi = a + i * h;
        % Acumula o valor da função no somatório
        soma = soma + f(xi);
    end

    % Aplica a fórmula final
    I = (h / 2) * (f(a) + 2 * soma + f(b));
endfunction
