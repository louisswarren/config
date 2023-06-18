nnoremap <buffer><F5> :!./%.vimout<CR>
nnoremap <buffer><F9> :w<CR>:!clear<CR>:!gcc -Ofast -std=c99 $(xargs echo < ~/.config/cflags.txt) -o %.vimout %<CR>:!./%.vimout<CR>:!rm %.vimout<CR>


nnoremap <S-F10> :!make CFLAGS="$(xargs echo < ~/.config/cflags.txt)"<CR>
nnoremap <F10> :!make<CR>

set tabstop=8
set shiftwidth=8
set softtabstop=8

let c_space_errors = 1

highlight WhiteSpaceBol ctermbg=magenta
match WhiteSpaceBol /^ \+/

noreabbrev newprogram #include <stdio.h><cr><cr>int<cr>main(void)<cr>{<cr>return 0;<cr>}<esc>kka

syn keyword cType u08 u16 u32 u64 i08 i16 i32 i64 usz isz flt dbl chr nil
