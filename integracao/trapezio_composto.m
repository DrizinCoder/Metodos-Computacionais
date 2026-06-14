function I = trapezio_composto(f, a, b, n)
    % Calcula o tamanho de cada subintervalo
    h = (b - a) / n;

    % Cria o vetor de pontos x de 'a' até 'b' com passo 'h'
    x = a:h:b;

    % Avalia a função em todos os pontos x vetorialmente
    y = f(x);

    % Aplica a fórmula: extremos + 2*soma(miolo)
    % y(1) é f(x_0) e y(end) é f(x_n)
    I = (h / 2) * (y(1) + 2 * sum(y(2:end-1)) + y(end));
endfunction
