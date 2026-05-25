function val_interpol = lagrange(fxs, Lterms, n)
    val_interpol = 0;
    for i = 1:n
      val_interpol = val_interpol + (fxs(i) * Lterms(i));
    endfor
endfunction
