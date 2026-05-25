function terms = Lterms(xs, x_target, n)
    for k = 1:n
      num = 1;
      deno = 1;
      for j = 1:n
        if j ~= k
          num = num * (x_target - xs(j));
          deno = deno * (xs(k) - xs(j));
        endif
      endfor
      terms(k) = num/deno;
    endfor
endfunction
