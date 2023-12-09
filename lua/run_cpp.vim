nnoremap <silent> <buffer> <C-Enter> :call <SID>compile_run_cpp()<CR>

function! s:compile_run_cpp() abort
    let src_path = expand('%:p:~')
    let src_noext = expand('%:p:~:r')
    " The building flags
    let _flag = '-pedantic-errors -Wall -Werror -g3 -O0 --std=c++03'

    if executable('g++')
        let prog = 'g++'
    " elseif executable('clang++')
    "     let prog = 'clang++'
    else
        echoerr 'No compiler found!'
    endif
    call s:create_term_buf('v', 80)
    execute printf('term %s %s %s -o %s && %s', prog, _flag, src_path, src_noext, src_noext)
    " startinsert
endfunction

function s:create_term_buf(_type, size) abort
    set splitbelow
    set splitright
    if a:_type ==# 'v'
        vnew
    else
        new
    endif
    execute 'resize ' . a:size
endfunction
