function c = regressao_polinomial(x, y, grau)
    % Retorna os coeficientes da regressão polinomial de grau 'grau'
    % c(1) é o termo constante, c(2) é o coeficiente de x^1, etc.
    
    % 1. Monta o sistema usando o algoritmo do verso do papel
    [A, b] = montar_sistema_polinomial(x, y, grau);
    
    % 2. Resolve o sistema linear 
    c = gaussPivotParc(A, b);
end