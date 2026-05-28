function y_estimado = predizer_polinomio(x_vetor, coeficientes)
    % x_vetor: Vetor coluna com os pontos de X que você quer avaliar
    % coeficientes: Vetor coluna com os coeficientes obtidos na regressão

    % Garante que o vetor de saída comece zerado e com o mesmo tamanho de x_vetor
    y_estimado = zeros(size(x_vetor));

    % Avalia o polinômio termo a termo de forma vetorizada
    for i = 1:length(coeficientes)
        y_estimado = y_estimado + coeficientes(i) * x_vetor.^(i-1);
    end
end
