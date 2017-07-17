" make tree view the default in netrw
let g:netrw_liststyle=3

" global code style stuff
set colorcolumn=80
set expandtab

" map ctrl keys used by chrome to the leader key
nnoremap <Leader>n <C-n>
nnoremap <Leader>t <C-t>
nnoremap <Leader>v <C-v>
nnoremap <Leader>w <C-w>
nnoremap <Leader>y <C-y>

" mappings to get into normal mode
noremap jj <Esc>
tnoremap jj <C-\><C-n>

" open a shell
nnoremap <Leader>s :botright split <BAR> terminal zsh<CR>

" execute a shell command
nnoremap <Leader>c :botright split <BAR> terminal 

" zoom in to current window
nnoremap <Leader>z :tabnew %<CR>

" open explorer tab at directory (and cd to that directory)
command! -nargs=1 -complete=file -bar CDExplore tabedit | lcd <args> | Explore
