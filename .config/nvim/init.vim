call plug#begin('~/.local/share/nvim/plugged')
Plug 'altercation/vim-colors-solarized'
Plug 'NLKNguyen/papercolor-theme'
Plug 'dracula/vim'
Plug 'tpope/vim-obsession'
Plug 'ensime/ensime-vim', { 'do': ':UpdateRemotePlugins' }
Plug 'derekwyatt/vim-scala'
Plug 'pangloss/vim-javascript'
Plug 'hdima/python-syntax'
Plug 'vim-syntastic/syntastic'
call plug#end()

" make tree view the default in netrw
let g:netrw_liststyle=3

" global code style stuff
set colorcolumn=80
set expandtab
set number

set mouse=a
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
"nnoremap <Leader>t :CDExplore $WORKDIR/

" yank the sytax I use for multiline shell commands without the newlines
vnoremap <Leader>yc :s/\\\n *// <BAR> :nohlsearch <BAR> :normal y$ <BAR> u

" syntastic defaults
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

" ensime defaults
"autocmd BufWritePost *.scala silent :EnTypeCheck
"nnoremap <localleader>t :EnType<CR>
"au FileType scala nnoremap <localleader>df :EnDeclarationSplit<CR>

colorscheme PaperColor
