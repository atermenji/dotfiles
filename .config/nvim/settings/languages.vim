autocmd FileType astro call Astro_settings()

function! Astro_settings()
  setlocal tabstop=2
  setlocal shiftwidth=2
  setlocal expandtab
endfunction
