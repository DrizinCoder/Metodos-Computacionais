function x = gauss_simples(A, b)
    n = size(A, 1);
    Ab = [A b];

    disp('Matriz Aumentada Inicial:');
    disp(Ab);

    for k = 1:n-1
        for i = k+1:n
            m = Ab(i, k) / Ab(k, k);
            Ab(i, k:n+1) = Ab(i, k:n+1) - m * Ab(k, k:n+1);
        end
        disp(['Matriz após eliminação na coluna ', num2str(k), ':']);
        disp(Ab);
    end

    x = zeros(n, 1);
    x(n) = Ab(n, n+1) / Ab(n, n);
    for i = n-1:-1:1
        soma = 0;
        for j = i+1:n
            soma = soma + Ab(i, j) * x(j);
        end
        x(i) = (Ab(i, n+1) - soma) / Ab(i, i);
    end
end
