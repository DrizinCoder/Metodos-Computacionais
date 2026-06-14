function I = simpson_simples(f, a, b)
    % O intervalo é dividido em 2 partes
    h = (b - a) / 2;

    % Ponto médio
    x1 = a + h;

    % Aplica a fórmula de Simpson 1/3 simples
    I = (h / 3) * (f(a) + 4 * f(x1) + f(b));
endfunction
