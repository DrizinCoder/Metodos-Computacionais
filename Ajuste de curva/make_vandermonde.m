function V = make_vandermonde(xs, n)
    V = zeros(n, n);

  for i = 1:n
    for j = 1:n
      V(i, j) = xs(i)^(j-1);
    endfor
  endfor
endfunction
