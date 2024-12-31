nnoremap <buffer><f9> :w<cr>:!sqlite3 ':memory:' < "%"<cr>
setlocal expandtab
nnoremap <leader>g ?select<cr>wv/^from<cr>k$y)ogroup<tab>by<cr><tab><tab><esc>p
