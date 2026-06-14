function I = trapezio_simples(f, a, b)
    % Calcula o passo (tamanho do intervalo)
    h = b - a;

    % Aplica a fórmula do trapézio simples
    I = (h / 2) * (f(a) + f(b));
endfunction
