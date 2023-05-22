nnoremap <buffer><F5> :!./%.vimout<CR>
nnoremap <buffer><F9> :w<CR>:!clear<CR>:!gcc -o %.vimout -Wall -Ofast -std=c99 %<CR>:!./%.vimout<CR>:!rm %.vimout<CR>

nnoremap <F10> :!make CFLAGS="$(xargs echo < ~/.config/cflags.txt)"<CR>

set tabstop=8
set shiftwidth=8
set softtabstop=8

let c_space_errors = 1

highlight WhiteSpaceBol ctermbg=magenta
match WhiteSpaceBol /^ \+/

noreabbrev newprogram #include <stdio.h><cr><cr>int<cr>main(void)<cr>{<cr>return 0;<cr>}<esc>kka

syn keyword cType u08 u16 u32 u64 i08 i16 i32 i64 usz isz flt dbl chr nil

"-Wpedantic
"-pedantic-errors
"-fmax-errors=2
"-Wall
"-Wextra
"-fanalyzer
"-Warray-bounds=2
"-Wcast-align=strict
"-Wcast-qual
"-Wdangling-else
"-Wdate-time
"-Wdouble-promotion
"-Wformat=2
"-Wformat-overflow=2
"-Wformat-signedness
"-Wformat-truncation=2
"-Winit-self
"-Wjump-misses-init
"-Wlogical-op
"-Wmissing-include-dirs
"-Wnested-externs
"-Wnull-dereference
"-Wpacked
"-Wredundant-decls
"-Wshadow
"-Wshift-overflow=2
"-Wstrict-overflow=5
"-Wstrict-prototypes
"-Wstringop-overflow=4
"-Wstringop-truncation
"-Wswitch-default
"-Wswitch-enum
"-Wuninitialized
"-Wunsafe-loop-optimizations
"-Wunused
"-Wunused-const-variable=2
"-Wunused-parameter
"-Wuse-after-free=3
"-Wwrite-strings
"-Wshift-negative-value
"-Wshift-overflow=2
"-Wuninitialized
"-Wstrict-aliasing
"-Wstrict-overflow=2
"-Wcast-align=strict
"-Wwrite-strings
"-Wdangling-else
"-Wjump-misses-init
"-Wfloat-conversion
"-Wstrict-prototypes
"-Wredundant-decls

