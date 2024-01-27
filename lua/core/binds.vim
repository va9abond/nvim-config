function! NetrwMapping()
    nmap <buffer> h u
    nmap <buffer> o -^

    nmap <buffer> l <CR>
    nmap <buffer> L <CR>:Lexplore<CR>

    nmap <buffer> <TAB> mf
    nmap <buffer> <Leader><TAB> mF


    nmap <buffer> o %:w<CR>:buffer #<CR>
    " nmap <buffer> fr R

    nmap <buffer> fc mc
    nmap <buffer> fC mtmc

    nmap <buffer> fm mm
    nmap <buffer> fM mtmm

    " nmap <buffer> f; mx

endfunction


augroup netrw_mapping
    autocmd!
    autocmd filetype netrw call NetrwMapping()
augroup END
