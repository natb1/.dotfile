call plug#begin('~/.local/share/nvim/plugged')
Plug 'altercation/vim-colors-solarized'
Plug 'dracula/vim'
Plug 'tpope/vim-obsession'
call plug#end()

" make tree view the default in netrw
let g:netrw_liststyle=3

" global code style stuff
set colorcolumn=80
set expandtab
set number

set autoread

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
nnoremap <Leader>s :botright split <BAR> terminal zsh<CR>

" execute a shell command
nnoremap <Leader>c :botright split <BAR> terminal 

" open explorer tab at directory (and cd to that directory)
command! -nargs=1 -complete=file -bar CDExplore tabedit | lcd <args> | Explore
nnoremap <Leader>t :CDExplore $WORKDIR/

" yank the sytax I use for multiline shell commands without the newlines
vnoremap <Leader>yc :s/\\\n *// <BAR> :nohlsearch <BAR> :normal y$ <BAR> u
