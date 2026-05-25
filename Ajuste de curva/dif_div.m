function diffs = dif_div(xs, fxs, n)
  diffs = zeros(n, n);

  for i = 1:n
    diffs(i, 1) = fxs(i);
  endfor

  for j = 1:n
    for i = 1:(n-j)
      diffs(i, j+1) = (diffs(i+1, j) - diffs(i, j))/(xs(i+j)-xs(i));
    endfor
  endfor

endfunction
