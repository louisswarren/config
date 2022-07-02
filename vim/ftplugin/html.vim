set tabstop=2
set shiftwidth=2
set softtabstop=2

nnoremap <C-b> 0"myf>o<esc>"mp0a/<esc>ea!<esc>dt>
nnoremap <buffer><f5> :!qutebrowser "file://$(pwd)/%"<cr>
