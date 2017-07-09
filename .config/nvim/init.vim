" map ctrl keys used by chrome to the leader key
nnoremap <Leader>n <C-n>
nnoremap <Leader>t <C-t>
nnoremap <Leader>v <C-v>
nnoremap <Leader>w <C-w>
nnoremap <Leader>y <C-y>

" mappings to get into normal mode
inoremap jj <Esc>
tnoremap jj <C-\><C-n>

" open a shell
nnoremap <Leader>s :botrigh split +terminal\ zsh<CR>

" zoom in to current window
nnoremap <Leader>z :tabnew %<CR>
