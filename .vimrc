set autoindent
set syntax=on
set nocp
set softtabstop=4
filetype plugin on
"colorscheme IDLE
let g:pydiction_location='/root/conf/vi/complete-dict'

let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_Right_Window = 1

set tags=tags;
    set autochdir

map <silent> <F5> mz?(*)<CR>yyggpA;<ESC>'z  " 创建函数原型
imap <silent> <F5> <ESC>mz?(*)<CR>yyggpA;<ESC>'zA

map <F6> :call Test()<CR>            " 调试
imap <F6> <ESC>:call Test()<CR>

map <silent> <F7> :Grep<CR><CR><CR>        " 全局搜索
imap <silent> <F7> <ESC>:Grep<CR><CR><CR>

map <F8> i#<ESC>j0                " 注释
imap <F8> <ESC>i#<ESC>j0

map <F9> 0Ji<CR><ESC>                "对齐 平级
imap <F9> <ESC>0Ji<CR><ESC>

map <F10> 0Ji<CR>    <ESC>            "对齐 增加缩进
imap <F10> <ESC>0Ji<CR>    <ESC>

map <F11> 0Ji<CR><ESC>XXXX<ESC>            "对齐 减少缩进
imap <F11> <ESC>0Ji<CR><ESC>XXXX<ESC>

function Python_Test()
    let mp = &makeprg
    let ef = &errorformat
    let exeFile = expand("%:t")
    setlocal makeprg=python\ -u
    set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
    silent make %
    copen
    let &makeprg     = mp
    let &errorformat = ef
endfunction

function C_Test()
    let cmd = "!gcc "
    let option = "-O2 "
    if search("math\.h") != 0
    let option .= " -lm "
    endif
    exec cmd. " % " .option
    endif

    exec "!./a.out"
    copen
endfunction

function Test()
    exec "w"
    if    &filetype == "c"
    exec "call C_Test()"
    elseif &filetype == "python"
    exec "call Python_Test()"
    endif
endfunction
