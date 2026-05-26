function c = regressao_linear_multipla(X, y)
    % X: Matriz com as variáveis independentes (cada coluna é uma variável)
    % y: Vetor coluna da variável dependente
    
    n = length(y);         % Quantidade de pontos da amostra
    num_vars = size(X, 2); % Quantidade de variáveis independentes
    m = num_vars + 1;      % Número de coeficientes (incluindo o termo constante)
    
    % Adiciona uma coluna de 1s no início da matriz X para o termo constante
    X_mat = [ones(n, 1), X];
    
    % Inicializa a matriz de somatórios A e vetor b
    A = zeros(m, m);
    b = zeros(m, 1);
    
    % Montagem manual da matriz de somatórios (Equações Normais)
    for i = 1:m
        for j = 1:m
            soma_A = 0;
            for k = 1:n
                soma_A = soma_A + X_mat(k, i) * X_mat(k, j);
            end
            A(i, j) = soma_A;
        end
        
        soma_b = 0;
        for k = 1:n
            soma_b = soma_b + X_mat(k, i) * y(k);
        end
        b(i) = soma_b;
    end
    
    % Resolve o sistema linear sem usar funções prontas
    c = eliminar_gauss(A, b);
end