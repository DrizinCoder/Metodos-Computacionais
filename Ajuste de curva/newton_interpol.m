function interpol_val = newton_interpol(diffs, xs, x_target, n)
  y = diffs(1,1);
  term = 1;

  for i = 2:n
    term = term*(x_target-xs(i-1));

    y = y+(diffs(1, i) * term);
  endfor

  interpol_val = y;
endfunction
