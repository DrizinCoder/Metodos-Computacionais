% 1. Definindo a função f(x) = e^(x^2)
f = @(x) exp(x.^2);

% 2. Definindo os limites de integração (exemplo: de 0 a 1)
a = 0;
b = 1;

res_trap_simp = trapezio_simples(f, a, b);
res_simp_simp = simpson_simples(f, a, b);

n = 10;
res_trap_comp = trapezio_composto(f, a, b, n);
res_simp_comp = simpson_composto(f, a, b, n);

% 3. Imprimindo os resultados
fprintf('Trapézio Simples: %f\n', res_trap_simp);
fprintf('Trapézio Composto (n=%d): %f\n', n, res_trap_comp);
fprintf('Simpson Simples: %f\n', res_simp_simp);
fprintf('Simpson Composto (n=%d): %f\n', n, res_simp_comp);
