% Definindo a função f(x) = e^(x^2)
f = @(x) exp(x.^2);

a = 0;
b = 1;
n = 10; % Número de subintervalos

% Chamando as versões com for
res_trap_comp = trapezio_composto_for(f, a, b, n);
res_simp_comp = simpson_composto_for(f, a, b, n);

% Exibindo os resultados
fprintf('Trapézio Composto com FOR (n=%d): %f\n', n, res_trap_comp);
fprintf('Simpson Composto com FOR (n=%d): %f\n', n, res_simp_comp);
