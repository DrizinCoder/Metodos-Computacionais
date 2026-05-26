function r2 = calcular_r2(y_real, y_predito)
    % y_real: Vetor coluna com os dados originais da amostra
    % y_predito: Vetor coluna com os valores estimados pelo polinômio
    
    n = length(y_real);
    
    % 1. Calcula a média dos valores reais
    soma_y = 0;
    for i = 1:n
        soma_y = soma_y + y_real(i);
    end
    media_y = soma_y / n;
    
    % 2. Calcula SQ_res e SQ_tot usando laços simples
    sq_res = 0;
    sq_tot = 0;
    
    for i = 1:n
        sq_res = sq_res + (y_real(i) - y_predito(i))^2;
        sq_tot = sq_tot + (y_real(i) - media_y)^2;
    end
    
    % 3. Aplica a fórmula do R²
    r2 = 1 - (sq_res / sq_tot);
end